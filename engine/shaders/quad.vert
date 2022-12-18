#version 410 core

layout (location = 0) in vec2 a_LocalPosition;
layout (location = 1) in vec2 a_Offset;
layout (location = 2) in float a_Rotation;
layout (location = 3) in vec3 a_Position;
layout (location = 4) in vec4 a_Color;
layout (location = 5) in vec2 a_TexCoord;
layout (location = 6) in float a_TexIndex;

uniform mat4 u_Proj;
uniform mat4 u_View;
uniform mat4 u_Squish;

out vec4 v_Color;
out vec2 v_TexCoord;
out float v_TexIndex;

mat2 rotate2d(float a){
    return mat2(cos(a), -sin(a),
                sin(a), cos(a));
}

void main()
{
    v_Color = a_Color;
    v_TexCoord = a_TexCoord;
    v_TexIndex = a_TexIndex;
    vec3 world_position = a_Position + vec3(rotate2d(a_Rotation) * (a_LocalPosition + a_Offset), 0.0);
    gl_Position = u_Proj * u_View * u_Squish * vec4(world_position, 1.0);
}
