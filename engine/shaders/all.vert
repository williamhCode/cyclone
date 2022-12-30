#version 410 core

layout (location = 0) in float a_RenderType;
layout (location = 1) in vec3 a_Position;
layout (location = 2) in vec4 a_Color;
layout (location = 3) in vec4[3] a_ExtraData;
// layout (location = 4) used ...
// layout (location = 5) used ...

uniform mat4 u_ProjView;

out float v_RenderType;
out vec4 v_Color;

out TEXTURE_OUT
{
    vec2 TexCoord;
    float TexIndex;
} v_Texture;

out CIRCLE_OUT
{
    vec2 LocalPosition;
    float Thickness;
    float Fade;
} v_Circle;

out RECT_OUT
{
    vec2 RelativeCoord;
    vec2 Thickness;
    vec2 Fade;
} v_Rect;


mat2 rotate2d(float a){
    return mat2(cos(a), -sin(a),
            sin(a), cos(a));
}

void main()
{
    // 0 = texture, 1 = circle, 2 = rectangle, 3 = line
    int renderType = int(a_RenderType);
    v_RenderType = a_RenderType;
    v_Color = a_Color;

    switch (renderType) {
        case 0: {
            vec2 a_LocalPosition = a_ExtraData[0].xy;
            vec2 a_Offset = a_ExtraData[0].zw;
            float a_Rotation = a_ExtraData[1].x;
            vec2 a_TexCoord = a_ExtraData[1].yz;
            float a_TexIndex = a_ExtraData[1].w;

            v_Texture.TexCoord = a_TexCoord;
            v_Texture.TexIndex = a_TexIndex;

            vec3 world_position = a_Position + vec3(rotate2d(a_Rotation) * (a_LocalPosition + a_Offset), 0.0);
            gl_Position = u_ProjView * vec4(world_position, 1.0);
            break;

        } case 1: {
            vec2 a_LocalPosition = a_ExtraData[0].xy;
            float a_Thickness = a_ExtraData[0].z;
            float a_Fade = a_ExtraData[0].w;

            v_Circle.LocalPosition = a_LocalPosition;
            v_Circle.Thickness = a_Thickness;
            v_Circle.Fade = a_Fade;

            gl_Position = u_ProjView * vec4(a_Position, 1.0);
            break;

        } case 2: {
            vec2 a_LocalPosition = a_ExtraData[0].xy;
            vec2 a_Offset = a_ExtraData[0].zw;
            float a_Rotation = a_ExtraData[1].x;
            vec2 a_RelativeCoord = a_ExtraData[1].yz;
            vec2 a_Thickness = a_ExtraData[2].xy;
            vec2 a_Fade = a_ExtraData[2].zw;

            v_Rect.RelativeCoord = a_RelativeCoord;
            v_Rect.Thickness = a_Thickness;
            v_Rect.Fade = a_Fade;

            vec3 world_position = a_Position + vec3(rotate2d(a_Rotation) * (a_LocalPosition + a_Offset), 0.0);
            gl_Position = u_ProjView * vec4(world_position, 1.0);
            break;

        } case 3: {
            gl_Position = u_ProjView * vec4(a_Position, 1.0);
            break;

        }
    }
}

