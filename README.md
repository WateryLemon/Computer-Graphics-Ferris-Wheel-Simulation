![3D_Interactive_Ferris_Wheel_Simulator _🎡](https://github.com/user-attachments/assets/0da4cb01-2bb5-472b-9f77-97d59e5ba9ea)

<a name="top"></a>

![Language: C++](https://img.shields.io/badge/language-C%2B%2B-F34B7D)
![Rendering API: OpenGL](https://img.shields.io/badge/rendering_api-OpenGL-5487A6)
![Uni Project](https://img.shields.io/badge/-university%20project-red?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/WateryLemon/Computer-Graphics-Summative)

⭐ Star us on GitHub — every star is greatly appreciated

## Table of Contents
- [About](#-about)
- [How to Build](#-how-to-build)
- [Project Structure & Components](#-project-structure--components)
- [Contacts](#-contacts)



<a name="about"></a>
## 🚀 About

**3D Interactive Ferris Wheel Simulator** is a C++/OpenGL application that demonstrates modern real-time graphics techniques through an immersive, interactive simulation of a Ferris wheel. The project is designed for educational and demonstrative purposes, showcasing key concepts in computer graphics and interactive 3D environments.

- **Real-Time 3D Rendering**: Renders a detailed Ferris wheel and environment using OpenGL, with support for dynamic camera movement and user interaction.
- **Advanced Lighting**: Implements ambient, diffuse, and specular lighting models, including specular maps for realistic material highlights.- **Maintainability**: Clear structure and separation facilitate better management of the codebase.
- **Depth Buffering**: Utilizes a depth buffer to ensure correct rendering order and visual depth cues.
- **Interactive Camera**: Provides multiple camera modes, including free movement and ride-along perspectives.
- **Modular Code Structure**: Organized into reusable components for meshes, shaders, textures, and controls, supporting extensibility and maintainability.

This simulator was an ideal project for learning and demonstrating core graphics programming concepts, and serves to build up my understanding of the foundation. Hopefully this leads to more complex 3D applications in OpenGL.



<a name="how-to-build"></a>
## 📝 How to Build

To build this project, follow these steps:

```shell
# Open a terminal (Terminal for macOS or Linux)

# Ensure Git is installed
# Visit https://git-scm.com to download and install Git if not already installed

# Clone the repository
git clone https://github.com/WateryLemon/Computer-Graphics-Summative.git

# Navigate to the project directory
cd Computer-Graphics-Summative

# Install dependencies
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required libraries:
# (Mac):
brew install glfw glm cmake 

# (Linux):
sudo apt update
sudo apt install cmake libglfw3-dev libglm-dev build-essential

# (Windows):
# - https://cmake.org/download/
# - https://www.glfw.org/download.html
# - https://github.com/g-truc/glm/releases


# Open the project in Visual Studio Code
code .

# In VS Code, open the Command Palette:
# Press ⌘ Shift P (Command + Shift + P)


## 📚 Project Structure & Components
# Type and select:
CMake: Build

# The build output will appear in the terminal/output pane.
```



<a name="project-structure-components"></a>
## 📚 Project Structure & Components

This project is a modular OpenGL graphics application. Here’s a deeper look at each major component:

### 🔦 Lighting

Lighting in this project is handled through multiple models:

- **Point Light:** Simulates a light source that emits light in all directions from a single point. The intensity decreases with distance, using attenuation factors for realism. The shader calculates ambient, diffuse, and specular contributions, and applies them using the object's textures.
- **Directional Light:** Mimics sunlight, where light rays are parallel and have no attenuation. The direction is fixed, and the shader computes how much each surface faces the light for diffuse and specular effects.
- **Spot Light:** Represents a cone-shaped light (like a flashlight). The shader uses inner and outer cone angles to smoothly blend the light’s edge, and calculates intensity based on the angle between the light direction and the fragment position.

Lighting calculations are performed in the fragment shader (`src/default.frag`), and each light type can be toggled or combined for different effects.

---

### 🕳️ Depth

Depth handling ensures correct rendering of overlapping objects:

- **Depth Buffering:** Uses the z-buffer to keep track of fragment depths, so closer objects obscure farther ones.
- **Linear and Logistic Depth:** The shader includes functions to linearize the non-linear depth buffer values and apply a logistic function for smoother depth-based effects (e.g., fog, depth visualization).  
  - `linearizeDepth(depth)` converts the default depth value to a linear scale.
  - `logisticDepth(depth, steepness, offset)` applies a logistic curve to the linearized depth, useful for advanced visual effects or debugging.

You can visualize depth by uncommenting the relevant line in the shader’s `main()` function.

---

### 🖼️ Shaders

Shaders are small programs running on the GPU to control rendering:

- **Vertex Shaders:** Transform 3D coordinates to 2D screen space and pass data to the fragment shader.
- **Fragment Shaders:** Calculate the color of each pixel, handling lighting, texturing, and depth effects.
- **Shader Management:** The project uses a `shaderClass` to load, compile, and manage shader programs, making it easy to switch or update shaders.

Custom shaders are used for lighting, skybox rendering, and special effects.

---

### 🎥 Camera

The camera system allows interactive navigation:

- **Position & Orientation:** The camera’s position and direction can be controlled to move through the scene.
- **View Matrix:** The camera generates a view matrix, transforming world coordinates into camera space.
- **User Controls:** Typically, keyboard and mouse input are used to move and rotate the camera, supporting first-person or orbital views.

Camera logic is implemented in `src/Camera.cpp` and `src/Camera.h`.

---

### 🌌 Skybox

A skybox creates an immersive background:

- **Cube Map:** The skybox uses a cube map texture, wrapping the scene in a seamless environment (e.g., sky, stars).
- **Dedicated Shader:** A special shader renders the skybox, ensuring it always appears at the farthest depth and doesn’t interfere with scene lighting.

This enhances realism and provides context for the 3D scene.

---

### 🖼️ Textures

Textures add detail and realism:

- **Diffuse Maps:** Provide the base color for objects.
- **Specular Maps:** Control the shininess and highlight intensity.
- **Skybox Textures:** Used for the environment background.
- **Texture Management:** The `Texture` class loads images, creates OpenGL textures, and binds them for use in shaders.

Texture logic is in `src/Texture.cpp` and `src/Texture.h`.

---

### 🧩 Mesh

Meshes define the shape of 3D objects:

- **Vertex Data:** Includes positions, normals, colors, and texture coordinates.
- **VAO/VBO/EBO:** Uses Vertex Array Objects, Vertex Buffer Objects, and Element Buffer Objects for efficient GPU storage and rendering.
- **Mesh Class:** The `Mesh` class encapsulates geometry setup and draw calls, making it easy to render complex models.

Mesh logic is in `src/Mesh.cpp` and `src/Mesh.h`.

---

### 🏁 Main Application

The entry point (`src/Main.cpp`) orchestrates the application:

- **Initialization:** Sets up the window, OpenGL context, and loads resources (shaders, textures, meshes).
- **Scene Setup:** Configures lights, camera, and objects in the scene.
- **Render Loop:** Continuously updates the scene, processes user input, and draws each frame.
- **Cleanup:** Releases resources on exit.

### Tips
**Explore the `src/` directory for implementation details and to see how these components interact. Each module is designed for clarity and extensibility.**



<a name="contacts"></a>
## 📬 Contacts

For questions, feedback, or collaboration inquiries, please reach out:

- **Name:** Jules Tournier

[![Email](https://img.shields.io/badge/jules@tournier.us-white.svg?logo=gmail&logoColor=red)](mailto:jules@tournier.us)
[![GitHub](https://img.shields.io/badge/WateryLemon-white.svg?logo=github&logoColor=000000)](https://github.com/WateryLemon)
[![LinkedIn](https://img.shields.io/badge/Jules_Tournier-white.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTIwLjQ0NyAyMC40NTJoLTMuNTU0di01LjU2OWMwLTEuMzI4LS4wMjctMy4wMzctMS44NTItMy4wMzctMS44NTMgMC0yLjEzNiAxLjQ0NS0yLjEzNiAyLjkzOXY1LjY2N0g5LjM1MVY5aDMuNDE0djEuNTYxaC4wNDZjLjQ3Ny0uOSAxLjYzNy0xLjg1IDMuMzctMS44NSAzLjYwMSAwIDQuMjY3IDIuMzcgNC4yNjcgNS40NTV2Ni4yODZ6TTUuMzM3IDcuNDMzYTIuMDYyIDIuMDYyIDAgMCAxLTIuMDYzLTIuMDY1IDIuMDY0IDIuMDY0IDAgMSAxIDIuMDYzIDIuMDY1em0xLjc4MiAxMy4wMTlIMy41NTVWOWgzLjU2NHYxMS40NTJ6TTIyLjIyNSAwSDEuNzcxQy43OTIgMCAwIC43NzQgMCAxLjcyOXYyMC41NDJDMCAyMy4yMjcuNzkyIDI0IDEuNzcxIDI0aDIwLjQ1MUMyMy4yIDI0IDI0IDIzLjIyNyAyNCAyMi4yNzFWMS43MjlDMjQgLjc3NCAyMy4yIDAgMjIuMjIyIDBoLjAwM3oiIGZpbGw9IiMwQTY2QzIiLz48cGF0aCBzdHlsZT0iZmlsbDojZmZmO3N0cm9rZS13aWR0aDouMDIwOTI0MSIgZD0iTTQuOTE3IDcuMzc3YTIuMDUyIDIuMDUyIDAgMCAxLS4yNC0zLjk0OWMxLjEyNS0uMzg0IDIuMzM5LjI3NCAyLjY1IDEuNDM3LjA2OC4yNS4wNjguNzY3LjAwMSAxLjAxYTIuMDg5IDIuMDg5IDAgMCAxLTEuNjIgMS41MSAyLjMzNCAyLjMzNCAwIDAgMS0uNzktLjAwOHoiLz48cGF0aCBzdHlsZT0iZmlsbDojZmZmO3N0cm9rZS13aWR0aDouMDIwOTI0MSIgZD0iTTQuOTE3IDcuMzc3YTIuMDU2IDIuMDU2IDAgMCAxLTEuNTItMi42NyAyLjA0NyAyLjA0NyAwIDAgMSAzLjQxOS0uNzU2Yy4yNC4yNTQuNDIuNTczLjUxMi45MDguMDY1LjI0LjA2NS43OCAwIDEuMDItLjA1MS4xODYtLjE5Ny41MDQtLjMuNjUyLS4wOS4xMzItLjMxLjM2Mi0uNDQzLjQ2NC0uNDYzLjM1Ny0xLjEuNTAzLTEuNjY4LjM4MlpNMy41NTcgMTQuNzJWOS4wMDhoMy41NTd2MTEuNDI0SDMuNTU3Wk05LjM1MyAxNC43MlY5LjAwOGgzLjQxMXYuNzg1YzAgLjYxNC4wMDUuNzg0LjAyNi43ODMuMDE0IDAgLjA3LS4wNzMuMTI0LS4xNjIuNTI0LS44NjUgMS41MDgtMS40NzggMi42NS0xLjY1LjI3NS0uMDQyIDEtLjA0NyAxLjMzMi0uMDA5Ljc5LjA5IDEuNDUxLjMxNiAxLjk0LjY2NC4yMi4xNTcuNTU3LjQ5My43MTQuNzEzLjQyLjU5Mi42OSAxLjQxMi44MDggMi40NjQuMDc0LjY2My4wODQgMS4yMTUuMDg1IDQuNTc4djMuMjU4aC0zLjUzNnYtMi45ODZjMC0yLjk3LS4wMS0zLjQ3NC0uMDc0LTMuOTA4LS4wOS0uNjA2LS4zMTQtMS4wODItLjYzNC0xLjM0Mi0uMzk1LS4zMjItMS4wMjktLjQzNy0xLjcwMy0uMzA5LS44NTguMTYzLTEuMzU1Ljc1LTEuNTIzIDEuNzk3LS4wNzYuNDcxLS4wODQuODQ1LS4wODQgMy44MzR2Mi45MTRIOS4zNTN6Ii8+PC9zdmc+)](https://www.linkedin.com/in/jules-tournier-5a7b47229/)

Feel free to open an issue or pull request if you have suggestions or find any bugs!

[Back to top](#top)
