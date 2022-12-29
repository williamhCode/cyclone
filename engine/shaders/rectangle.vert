#version 410 core

layout (location = 0) in vec2 a_LocalPosition;
layout (location = 1) in vec2 a_Offset;
layout (location = 2) in float a_Rotation;

layout (location = 3) in vec3 a_Position;
layout (location = 4) in vec4 a_Color;

layout (location = 5) in vec2 a_RelativeCoord;
layout (location = 6) in vec2 a_Thickness;
layout (location = 7) in vec2 a_Fade;

uniform mat4 u_ProjView;

out vec2 v_RelativeCoord;
out vec4 v_Color;
out vec2 v_Thickness;
out vec2 v_Fade;

void main()
{
    v_RelativeCoord = a_RelativeCoord;
    v_Color = a_Color;
    v_Thickness = a_Thickness;
    v_Fade = a_Fade;
    vec3 world_position = a_Position + vec3(rotate2d(a_Rotation) * (a_LocalPosition + a_Offset), 0.0);
    gl_Position = u_ProjView * vec4(world_position, 1.0);
}
