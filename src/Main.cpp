#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <vector>
#include <iostream>
#include <stdexcept>
#include <string>
#include <cmath>
#include "Mesh.h"
#include "Texture.h"
#include "Camera.h"

// --- Window and Scene Constants ---
const unsigned int width = 800;
const unsigned int height = 800;

const float CYL_RADIUS = 3.0f;
const float CYL_WALL_THICKNESS = 0.05f;
const float CYL_DEPTH = 0.1f;
const float CYL_SPACING = 1.0f;
const int CYL_SEGMENTS = 64;
const float AXEL_RADIUS = 0.1f;
const int   AXEL_SEGMENTS = 64;
const int SPOKE_COUNT = 12;
const float SPOKE_RADIUS = 0.04f;
const float SPOKE_LENGTH = CYL_RADIUS;
const int CHAIR_BAR_COUNT = 12;
const float CHAIR_BAR_RADIUS = 0.03f;

float wheelRotation = 0.0f;
bool rotateWheel = true;

Camera chairCam(width, height, glm::vec3(0.0f));
int activeCamera = 0; // 0 = freecam, 1 = chaircam

// --- Skybox Geometry ---
float skyboxVertices[] =
{
    //   Coordinates
    -20.0f, -20.0f,  20.0f,//          7--------6
     20.0f, -20.0f,  20.0f,//         /|       /|
     20.0f, -20.0f, -20.0f,//        4--------5 |
    -20.0f, -20.0f, -20.0f,//        | |      | |
    -20.0f,  20.0f,  20.0f,//        | 3------|-2
     20.0f,  20.0f,  20.0f,//        |/       |/
     20.0f,  20.0f, -20.0f,//        0--------1
    -20.0f,  20.0f, -20.0f
};

unsigned int skyboxIndices[] =
{
	// Right
	1, 2, 6,
	6, 5, 1,
	// Left
	0, 4, 7,
	7, 3, 0,
	// Top
	4, 5, 6,
	6, 7, 4,
	// Bottom
	0, 3, 2,
	2, 1, 0,
	// Back
	0, 1, 5,
	5, 4, 0,
	// Front
	3, 7, 6,
	6, 2, 3
};

// --- Light Cube Geometry ---
Vertex lightVertices[] = {
    Vertex{glm::vec3(-0.03f, -0.03f,  0.03f)}, Vertex{glm::vec3(-0.03f, -0.03f, -0.03f)},
    Vertex{glm::vec3(0.03f, -0.03f, -0.03f)},  Vertex{glm::vec3(0.03f, -0.03f,  0.03f)},
    Vertex{glm::vec3(-0.03f,  0.03f,  0.03f)}, Vertex{glm::vec3(-0.03f,  0.03f, -0.03f)},
    Vertex{glm::vec3(0.03f,  0.03f, -0.03f)},  Vertex{glm::vec3(0.03f,  0.03f,  0.03f)}
};
GLuint lightIndices[] = {
    0, 2, 1, 0, 3, 2, 0, 4, 7, 0, 7, 3, 3, 7, 6, 3, 6, 2,
    2, 6, 5, 2, 5, 1, 1, 5, 4, 1, 4, 0, 4, 5, 6, 4, 6, 7
};

// --- Hollow Cylinder Mesh Generation ---
void generateHollowCylinder(
    float radius, float thickness, float depth, int segments, float zOffset,
    std::vector<Vertex>& vertices, std::vector<GLuint>& indices)
{
    float innerRadius = radius - thickness;
    float halfDepth = depth / 2.0f;
    for (int i = 0; i < segments; ++i) {
        float theta = 2.0f * glm::pi<float>() * i / segments;
        float cosT = cos(theta), sinT = sin(theta);
        vertices.push_back(Vertex{glm::vec3(radius * cosT, radius * sinT, zOffset + halfDepth), glm::vec3(cosT, sinT, 0.0f), glm::vec3(1.0f), glm::vec2((float)i / segments, 1.0f)});
        vertices.push_back(Vertex{glm::vec3(radius * cosT, radius * sinT, zOffset - halfDepth), glm::vec3(cosT, sinT, 0.0f), glm::vec3(1.0f), glm::vec2((float)i / segments, 0.0f)});
        vertices.push_back(Vertex{glm::vec3(innerRadius * cosT, innerRadius * sinT, zOffset + halfDepth), glm::vec3(-cosT, -sinT, 0.0f), glm::vec3(1.0f), glm::vec2((float)i / segments, 1.0f)});
        vertices.push_back(Vertex{glm::vec3(innerRadius * cosT, innerRadius * sinT, zOffset - halfDepth), glm::vec3(-cosT, -sinT, 0.0f), glm::vec3(1.0f), glm::vec2((float)i / segments, 0.0f)});
    }
    for (int i = 0; i < segments; ++i) {
        int next = (i + 1) % segments;
        int oF = i * 4 + 0, oB = i * 4 + 1, iF = i * 4 + 2, iB = i * 4 + 3;
        int oF_n = next * 4 + 0, oB_n = next * 4 + 1, iF_n = next * 4 + 2, iB_n = next * 4 + 3;
        
        indices.push_back(static_cast<unsigned int>(oF)); indices.push_back(static_cast<unsigned int>(oB)); indices.push_back(static_cast<unsigned int>(oF_n));
        indices.push_back(static_cast<unsigned int>(oB)); indices.push_back(static_cast<unsigned int>(oB_n)); indices.push_back(static_cast<unsigned int>(oF_n));
        
        indices.push_back(static_cast<unsigned int>(iF_n)); indices.push_back(static_cast<unsigned int>(iB)); indices.push_back(static_cast<unsigned int>(iF));
        indices.push_back(static_cast<unsigned int>(iF_n)); indices.push_back(static_cast<unsigned int>(iB_n)); indices.push_back(static_cast<unsigned int>(iB));
        
        indices.push_back(static_cast<unsigned int>(oF)); indices.push_back(static_cast<unsigned int>(iF)); indices.push_back(static_cast<unsigned int>(iF_n));
        indices.push_back(static_cast<unsigned int>(oF)); indices.push_back(static_cast<unsigned int>(iF_n)); indices.push_back(static_cast<unsigned int>(oF_n));
        
        indices.push_back(static_cast<unsigned int>(oB_n)); indices.push_back(static_cast<unsigned int>(iB_n)); indices.push_back(static_cast<unsigned int>(iB));
        indices.push_back(static_cast<unsigned int>(oB_n)); indices.push_back(static_cast<unsigned int>(iB)); indices.push_back(static_cast<unsigned int>(oB));
    }
}

void generateChair(
    float radius,         // outer radius of hemisphere
    float thickness,      // wall thickness
    float supportHeight,  // height of support cylinder
    int segments,         // segments for hemisphere
    std::vector<Vertex>& vertices,
    std::vector<GLuint>& indices
)
{
    // --- Hollow Hemisphere ---
    int rings = segments / 2; // latitude divisions
    int slices = segments;    // longitude divisions
    float innerRadius = radius - thickness;

    // Outer and inner hemisphere vertices
    for (int ring = 0; ring <= rings; ++ring) {
        float phi = glm::half_pi<float>() * (float)ring / (float)rings; // 0 to pi/2
        float y_outer = radius * cos(phi);
        float r_outer = radius * sin(phi);
        float y_inner = innerRadius * cos(phi);
        float r_inner = innerRadius * sin(phi);

        for (int slice = 0; slice <= slices; ++slice) {
            float theta = 2.0f * glm::pi<float>() * (float)slice / (float)slices;
            float x_outer = r_outer * cos(theta);
            float z_outer = r_outer * sin(theta);
            float x_inner = r_inner * cos(theta);
            float z_inner = r_inner * sin(theta);

            // Outer surface
            vertices.push_back(Vertex{
                glm::vec3(x_outer, y_outer, z_outer),
                glm::normalize(glm::vec3(x_outer, y_outer, z_outer)),
                glm::vec3(1.0f),
                glm::vec2((float)slice / slices, (float)ring / rings)
            });
            // Inner surface (flip normal)
            vertices.push_back(Vertex{
                glm::vec3(x_inner, y_inner, z_inner),
                -glm::normalize(glm::vec3(x_inner, y_inner, z_inner)),
                glm::vec3(1.0f),
                glm::vec2((float)slice / slices, (float)ring / rings)
            });
        }
    }

    // Indices for hemisphere (outer and inner)
    int vertsPerRing = (slices + 1) * 2;
    for (int ring = 0; ring < rings; ++ring) {
        for (int slice = 0; slice < slices; ++slice) {
            int i0 = ring * (slices + 1) * 2 + slice * 2;
            int i1 = i0 + 2;
            int i2 = i0 + (slices + 1) * 2;
            int i3 = i2 + 2;

            // Outer surface (CCW winding for outside faces)
            indices.push_back(i0);
            indices.push_back(i2);
            indices.push_back(i1);

            indices.push_back(i1);
            indices.push_back(i2);
            indices.push_back(i3);

            // Inner surface
            indices.push_back(i0 + 1);
            indices.push_back(i1 + 1);
            indices.push_back(i2 + 1);

            indices.push_back(i1 + 1);
            indices.push_back(i3 + 1);
            indices.push_back(i2 + 1);
        }
    }

    // --- Rim (side faces) at the open edge ---
    int outerStart = (rings) * (slices + 1) * 2; // start index of last ring's vertices
    for (int slice = 0; slice < slices; ++slice) {
        int outer0 = outerStart + slice * 2;     // outer surface vertex
        int inner0 = outer0 + 1;                 // inner surface vertex
        int outer1 = outer0 + 2;
        int inner1 = inner0 + 2;

        // First triangle
        indices.push_back(outer0);
        indices.push_back(inner0);
        indices.push_back(outer1);

        // Second triangle
        indices.push_back(outer1);
        indices.push_back(inner0);
        indices.push_back(inner1);
    }

    // --- Support Cylinder ---
    int baseIndex = vertices.size();
    float cylRadius = thickness * 0.7f; // thinner than shell
    float cylY0 = -radius; // bottom at lowest point of hemisphere
    float cylY1 = cylY0 + supportHeight;

    for (int i = 0; i <= segments; ++i) {
        float theta = 2.0f * glm::pi<float>() * i / segments;
        float x = cylRadius * cos(theta);
        float z = cylRadius * sin(theta);

        // Bottom ring
        vertices.push_back(Vertex{
            glm::vec3(x, cylY0, z),
            glm::vec3(x, 0, z),
            glm::vec3(1.0f),
            glm::vec2((float)i / segments, 0.0f)
        });
        // Top ring
        vertices.push_back(Vertex{
            glm::vec3(x, cylY1, z),
            glm::vec3(x, 0, z),
            glm::vec3(1.0f),
            glm::vec2((float)i / segments, 1.0f)
        });
    }
    // Indices for cylinder
    for (int i = 0; i < segments; ++i) {
        int i0 = baseIndex + i * 2;
        int i1 = i0 + 2;
        int i2 = i0 + 1;
        int i3 = i1 + 1;

        indices.push_back(i0);
        indices.push_back(i1);
        indices.push_back(i2);

        indices.push_back(i1);
        indices.push_back(i3);
        indices.push_back(i2);
    }

    float yOffset = cylY0; // Attach bottom of cylinder to bar
    for (auto& v : vertices) {
        v.position.y -= yOffset;
        v.position.y = -v.position.y;
        v.normal.y = -v.normal.y;
    }
}

void renderLoop(
    GLFWwindow* window,
    Camera& camera,
    Mesh& wheelFrame,
    Mesh& axel,
    Shader& shaderProgram,
    Mesh& light,
    Shader& lightShader,
    std::vector<Mesh>& spokes,
    std::vector<Mesh>& chairBars,
    Shader& skyboxShader,
    unsigned int skyboxVAO,
    unsigned int cubemapTexture,
    const glm::vec4& lightColor,
    const glm::vec3& lightPos,
    const glm::mat4& lightModel,
    std::vector<Mesh>& chairs,
    Mesh& lightMesh
)
{
    double prevTime = glfwGetTime(), lastTitleUpdate = prevTime;
    unsigned int frameCount = 0;
    static bool lastQState = false;
    while (!glfwWindowShouldClose(window))
    {
        double currentTime = glfwGetTime();
        double deltaTime = currentTime - prevTime;
        prevTime = currentTime;
        frameCount++;

        if (currentTime - lastTitleUpdate >= 0.5) {
            double elapsed = currentTime - lastTitleUpdate;
            double fps = frameCount / elapsed;
            double msPerFrame = 1000.0 / (fps > 0 ? fps : 1);
            std::string newTitle = "Test - " + std::to_string((int)fps) + " FPS / " + std::to_string(msPerFrame) + " ms";
            glfwSetWindowTitle(window, newTitle.c_str());
            lastTitleUpdate = currentTime;
            frameCount = 0;
        }

        glClearColor(0.85f, 0.85f, 0.90f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        // Chair camera follows chair 0, orientation fixed relative to world
        int chairIdx = 0;
        float angle = 2.0f * glm::pi<float>() * chairIdx / CHAIR_BAR_COUNT;
        glm::vec3 barPos = glm::vec3(CYL_RADIUS * cos(angle), CYL_RADIUS * sin(angle), 0.0f);
        glm::mat4 wheelRot = glm::rotate(glm::mat4(1.0f), wheelRotation, glm::vec3(0,0,1));
        glm::vec3 chairWorldPos = glm::vec3(wheelRot * glm::vec4(barPos, 1.0f));

        glm::vec3 up = glm::vec3(0, 1, 0);
        glm::vec3 forward = glm::normalize(-chairWorldPos); // Look toward center

        glm::vec3 camOffset = up * 0.5f + forward * 0.2f;
        chairCam.Position = chairWorldPos + camOffset;
        chairCam.Up = up;

        if (glfwGetKey(window, GLFW_KEY_1) == GLFW_PRESS) activeCamera = 0;
        if (glfwGetKey(window, GLFW_KEY_2) == GLFW_PRESS) activeCamera = 1;
        
        if (activeCamera == 0) {
            camera.Inputs(window, true); // Freecam: mouse + movement
            camera.updateMatrix(45.0f, 0.1f, 100.0f);
        } else {
            chairCam.Inputs(window, false); // Chaircam: mouse only
            chairCam.updateMatrix(45.0f, 0.1f, 100.0f);
        }

        // --- Draw Skybox ---
        glDepthMask(GL_FALSE);
        glDepthFunc(GL_LEQUAL);
        skyboxShader.Activate();
        glDisable(GL_CULL_FACE);
        glUniform1i(glGetUniformLocation(skyboxShader.ID, "skybox"), 0);
        glm::mat4 view = glm::mat4(glm::mat3(glm::lookAt(camera.Position, camera.Position + camera.Orientation, camera.Up)));
        glm::mat4 projection = glm::perspective(glm::radians(45.0f), (float)width / (float)height, 0.1f, 100.0f);
        glUniformMatrix4fv(glGetUniformLocation(skyboxShader.ID, "view"), 1, GL_FALSE, glm::value_ptr(view));
        glUniformMatrix4fv(glGetUniformLocation(skyboxShader.ID, "projection"), 1, GL_FALSE, glm::value_ptr(projection));
        glBindVertexArray(skyboxVAO);
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_CUBE_MAP, cubemapTexture);
        glDrawElements(GL_TRIANGLES, 36, GL_UNSIGNED_INT, 0);
        glBindVertexArray(0);
        glDepthMask(GL_TRUE);
        glDepthFunc(GL_LESS);

        glEnable(GL_DEPTH_TEST);
        glEnable(GL_CULL_FACE);
        glCullFace(GL_BACK);
        glFrontFace(GL_CCW);

        // --- Draw Ferris Wheel and Scene ---
        shaderProgram.Activate();
        glUniform4f(glGetUniformLocation(shaderProgram.ID, "lightColor"), lightColor.x, lightColor.y, lightColor.z, lightColor.w);
        glUniform3f(glGetUniformLocation(shaderProgram.ID, "lightPos"), lightPos.x, lightPos.y, lightPos.z);

        glm::mat4 objectModel = glm::rotate(glm::mat4(1.0f), wheelRotation, glm::vec3(0, 0, 1));
        Camera& activeCam = (activeCamera == 0) ? camera : chairCam;
        activeCam.Matrix(shaderProgram, "camMatrix");
        glUniformMatrix4fv(glGetUniformLocation(shaderProgram.ID, "model"), 1, GL_FALSE, glm::value_ptr(objectModel));
        wheelFrame.Draw(shaderProgram, activeCam);
        axel.Draw(shaderProgram, activeCam);

        for (auto& spoke : spokes) {
            shaderProgram.Activate();
            activeCam.Matrix(shaderProgram, "camMatrix");
            glUniformMatrix4fv(glGetUniformLocation(shaderProgram.ID, "model"), 1, GL_FALSE, glm::value_ptr(objectModel));
            spoke.Draw(shaderProgram, activeCam);
        }
        for (auto& bar : chairBars) {
            shaderProgram.Activate();
            activeCam.Matrix(shaderProgram, "camMatrix");
            glUniformMatrix4fv(glGetUniformLocation(shaderProgram.ID, "model"), 1, GL_FALSE, glm::value_ptr(objectModel));
            bar.Draw(shaderProgram, activeCam);
        }

        // --- Draw Chairs (rotating with wheel) ---
        for (int i = 0; i < chairs.size(); ++i) {
            shaderProgram.Activate();
            activeCam.Matrix(shaderProgram, "camMatrix");

            float angle = 2.0f * glm::pi<float>() * i / CHAIR_BAR_COUNT;
            glm::vec3 barPos = glm::vec3(CYL_RADIUS * cos(angle), CYL_RADIUS * sin(angle), 0.0f);

            glm::mat4 model = glm::rotate(glm::mat4(1.0f), wheelRotation, glm::vec3(0,0,1));
            model = glm::translate(model, barPos);
            model = glm::rotate(model, -wheelRotation, glm::vec3(0,0,1));

            glUniformMatrix4fv(glGetUniformLocation(shaderProgram.ID, "model"), 1, GL_FALSE, glm::value_ptr(model));
            chairs[i].Draw(shaderProgram, activeCam);
        }

        // --- Draw Light Cube ---
        lightShader.Activate();
        activeCam.Matrix(lightShader, "camMatrix");
        glUniformMatrix4fv(glGetUniformLocation(lightShader.ID, "model"), 1, GL_FALSE, glm::value_ptr(lightModel));
        glUniform4f(glGetUniformLocation(lightShader.ID, "lightColor"), lightColor.x, lightColor.y, lightColor.z, lightColor.w);
        light.Draw(lightShader, activeCam);

        // --- Animation and Input ---
        bool currentQState = glfwGetKey(window, GLFW_KEY_Q) == GLFW_PRESS;
        if (currentQState && !lastQState) rotateWheel = !rotateWheel;
        lastQState = currentQState;
        static double pausedTime = 0.0;
        if (rotateWheel) pausedTime = currentTime;
        wheelRotation = pausedTime * 0.5;

        glfwSwapBuffers(window);
        glfwPollEvents();
    }
}

// --- Main Entry Point ---
int main()
{
    try {
        // --- GLFW/GLAD Initialization ---
        glfwInit();
        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
        glfwWindowHint(GLFW_DEPTH_BITS, 24);

        GLFWwindow* window = glfwCreateWindow(width, height, "helloWorld", NULL, NULL);
        if (!window) { std::cout << "Failed to create GLFW window" << std::endl; glfwTerminate(); return -1; }
        glfwMakeContextCurrent(window);
        gladLoadGL();
        glViewport(0, 0, width, height);

        // --- Texture Setup ---
        Texture textures[] = {
            Texture("../resources/textures/planks.png", "diffuse", 0, GL_RGBA, GL_UNSIGNED_BYTE),
            Texture("../resources/textures/planksSpec.png", "specular", 1, GL_RED, GL_UNSIGNED_BYTE)
        };
        Texture axelTextures[] = {
            Texture("../resources/textures/metalColor.png", "diffuse", 0, GL_RGB, GL_UNSIGNED_BYTE),
            Texture("../resources/textures/metalMetalness.png", "specular", 1, GL_RED, GL_UNSIGNED_BYTE)
        };

        // --- Shader Setup ---
        Shader shaderProgram("../src/default.vert", "../src/default.frag");
        Shader skyboxShader("../src/skybox.vert", "../src/skybox.frag");
        Shader lightShader("../src/light.vert", "../src/light.frag");

        // --- Skybox Setup ---
        unsigned int skyboxVAO, skyboxVBO, skyboxEBO;
        glGenVertexArrays(1, &skyboxVAO);
        glGenBuffers(1, &skyboxVBO);
        glGenBuffers(1, &skyboxEBO);
        glBindVertexArray(skyboxVAO);
        glBindBuffer(GL_ARRAY_BUFFER, skyboxVBO);
        glBufferData(GL_ARRAY_BUFFER, sizeof(skyboxVertices), skyboxVertices, GL_STATIC_DRAW);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, skyboxEBO);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(skyboxIndices), skyboxIndices, GL_STATIC_DRAW);
        glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void*)0);
        glEnableVertexAttribArray(0);
        glBindVertexArray(0);

        // --- Cubemap Texture ---
        std::string facesCubemap[6] = {
            "../resources/textures/skybox/right.jpg",
            "../resources/textures/skybox/left.jpg",
            "../resources/textures/skybox/top.jpg",
            "../resources/textures/skybox/bottom.jpg",
            "../resources/textures/skybox/front.jpg",
            "../resources/textures/skybox/back.jpg"
        };
        unsigned int cubemapTexture;
        glGenTextures(1, &cubemapTexture);
        glBindTexture(GL_TEXTURE_CUBE_MAP, cubemapTexture);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_EDGE);
        stbi_set_flip_vertically_on_load(false);
        for (unsigned int i = 0; i < 6; i++) {
            int w, h, n;
            unsigned char* data = stbi_load(facesCubemap[i].c_str(), &w, &h, &n, 0);
            if (data) {
                glTexImage2D(GL_TEXTURE_CUBE_MAP_POSITIVE_X + i, 0, GL_RGB, w, h, 0, GL_RGB, GL_UNSIGNED_BYTE, data);
                stbi_image_free(data);
            } else {
                std::cout << "Cubemap texture failed to load at path: " << facesCubemap[i] << std::endl;
                stbi_image_free(data);
            }
        }

        // --- Geometry Generation ---
        std::vector<Vertex> wheelVerts, wheelVerts2, axelVerts;
        std::vector<GLuint> wheelInd, wheelInd2, axelInd;
        generateHollowCylinder(CYL_RADIUS, CYL_WALL_THICKNESS, CYL_DEPTH, CYL_SEGMENTS, +CYL_SPACING/2, wheelVerts, wheelInd);
        size_t baseIndex = wheelVerts.size();
        generateHollowCylinder(CYL_RADIUS, CYL_WALL_THICKNESS, CYL_DEPTH, CYL_SEGMENTS, -CYL_SPACING/2, wheelVerts2, wheelInd2);
        for (auto& idx : wheelInd2) idx += baseIndex;
        wheelVerts.insert(wheelVerts.end(), wheelVerts2.begin(), wheelVerts2.end());
        wheelInd.insert(wheelInd.end(), wheelInd2.begin(), wheelInd2.end());
        std::vector<Texture> tex(textures, textures + sizeof(textures) / sizeof(Texture));
        Mesh wheelFrame(wheelVerts, wheelInd, tex);

        generateHollowCylinder(AXEL_RADIUS, AXEL_RADIUS, CYL_SPACING, AXEL_SEGMENTS, 0.0f, axelVerts, axelInd);
        std::vector<Texture> axelTex(axelTextures, axelTextures + sizeof(axelTextures) / sizeof(Texture));
        Mesh axel(axelVerts, axelInd, axelTex);

        // --- Spokes Geometry Generation ---
        std::vector<Mesh> spokes;
        for (int w = 0; w < 2; ++w) {
            float zOffset = (w == 0) ? +CYL_SPACING / 2.0f : -CYL_SPACING / 2.0f;
            for (int i = 0; i < SPOKE_COUNT; ++i) {
                float angle = 2.0f * glm::pi<float>() * i / SPOKE_COUNT;
                std::vector<Vertex> spokeVerts;
                std::vector<GLuint> spokeInd;
                generateHollowCylinder(SPOKE_RADIUS, SPOKE_RADIUS, SPOKE_LENGTH, 24, 0.0f, spokeVerts, spokeInd);
                glm::mat4 rotToX = glm::rotate(glm::mat4(1.0f), glm::half_pi<float>(), glm::vec3(0,1,0));
                glm::mat4 shift = glm::translate(glm::mat4(1.0f), glm::vec3(SPOKE_LENGTH / 2.0f, 0, 0));
                glm::mat4 rotAroundZ = glm::rotate(glm::mat4(1.0f), angle, glm::vec3(0,0,1));
                glm::mat4 zTrans = glm::translate(glm::mat4(1.0f), glm::vec3(0, 0, zOffset));
                glm::mat4 model = zTrans * rotAroundZ * shift * rotToX;
                for (auto& v : spokeVerts) {
                    glm::vec4 pos = model * glm::vec4(v.position, 1.0f);
                    v.position = glm::vec3(pos);
                    v.normal = glm::mat3(rotAroundZ * shift * rotToX) * v.normal;
                }
                Mesh spoke(spokeVerts, spokeInd, tex);
                spokes.push_back(spoke);
            }
        }

        // --- Chair Bars Spokes Geometry Generation ---
        std::vector<Mesh> chairBars;
        for (int i = 0; i < CHAIR_BAR_COUNT; ++i) {
            float angle = 2.0f * glm::pi<float>() * i / CHAIR_BAR_COUNT;
            std::vector<Vertex> barVerts;
            std::vector<GLuint> barInd;
            generateHollowCylinder(CHAIR_BAR_RADIUS, CHAIR_BAR_RADIUS, CYL_SPACING, 24, 0.0f, barVerts, barInd);
            glm::mat4 trans = glm::translate(glm::mat4(1.0f), glm::vec3(CYL_RADIUS * cos(angle), CYL_RADIUS * sin(angle), 0.0f));
            for (auto& v : barVerts) {
                glm::vec4 pos = trans * glm::vec4(v.position, 1.0f);
                v.position = glm::vec3(pos);
            }
            Mesh bar(barVerts, barInd, tex);
            chairBars.push_back(bar);
        }

        // --- Chair Mesh Generation ---
        std::vector<Mesh> chairs;
        for (int i = 0; i < CHAIR_BAR_COUNT; ++i) {
            float angle = 2.0f * glm::pi<float>() * i / CHAIR_BAR_COUNT;

            std::vector<Vertex> chairVerts;
            std::vector<GLuint> chairInd;
            generateChair(
                0.5f,   // hemisphere outer radius
                0.05f,  // wall thickness
                1.0f,   // support length (customizable)
                32,     // segments
                chairVerts, chairInd
            );
            chairs.emplace_back(chairVerts, chairInd, tex);
        }

        // --- Light Mesh ---
        std::vector<Vertex> lightVerts(lightVertices, lightVertices + sizeof(lightVertices) / sizeof(Vertex));
        std::vector<GLuint> lightInd(lightIndices, lightIndices + sizeof(lightIndices) / sizeof(GLuint));
        std::vector<Texture> emptyTex;
        Mesh lightMesh(lightVerts, lightInd, emptyTex);


        // --- Light and Camera Setup ---
        glm::vec4 lightColor = glm::vec4(1.0f);
        // Move the light cube to the middle of the scene and above the ferris wheel
        glm::vec3 lightPos = glm::vec3(0.0f, CYL_RADIUS + 1.0f, 0.0f); // X=0, Y=above wheel, Z=0
        glm::mat4 lightModel = glm::translate(glm::mat4(1.0f), lightPos);
        Camera camera(width, height, glm::vec3(0.0f, 0.0f, 8.0f));

        // --- OpenGL State ---
        glEnable(GL_DEPTH_TEST);
        glDepthFunc(GL_LESS);
        glEnable(GL_CULL_FACE);
        glCullFace(GL_BACK);
        glFrontFace(GL_CCW);

        // --- Main Render Loop ---
        renderLoop(
            window, camera, wheelFrame, axel, shaderProgram, lightMesh, lightShader, spokes, chairBars,
            skyboxShader, skyboxVAO, cubemapTexture,
            lightColor, lightPos, lightModel,
            chairs,
            lightMesh
        );

        shaderProgram.Delete();
        lightShader.Delete();
        glfwDestroyWindow(window);
        glfwTerminate();
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "Exception: " << e.what() << std::endl;
        return 1;
    }
}
