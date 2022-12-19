#version 410 core

layout (location = 0) in vec3 a_Position;
layout (location = 1) in vec4 a_Color;

// uniform mat4 u_Proj;
// uniform mat4 u_View;
// uniform mat4 u_Squish;
uniform mat4 u_ProjViewSquish;

out vec4 v_Color;

void main()
{
    v_Color = a_Color;
    // gl_Position = u_Proj * u_View * u_Squish * vec4(a_Position, 1.0);
    gl_Position = u_ProjViewSquish * vec4(a_Position, 1.0);
}

