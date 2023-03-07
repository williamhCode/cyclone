#version 410 core

layout (location = 0) in vec3 a_Position;
layout (location = 1) in vec4 a_Color;

uniform mat4 u_ProjView;

out vec4 v_Color;

void main()
{
    v_Color = a_Color;
    gl_Position = u_ProjView * vec4(a_Position, 1.0);
}

