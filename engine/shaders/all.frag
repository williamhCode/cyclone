#version 410 core

layout (location = 0) out vec4 o_Color;

in float v_RenderType;
in vec4 v_Color;

in TEXTURE_OUT
{
    vec2 TexCoord;
    float TexIndex;
} v_Texture;

uniform sampler2D u_Textures[16];

in CIRCLE_OUT
{
    vec2 LocalPosition;
    float Thickness;
    float Fade;
} v_Circle;

in RECT_OUT
{
    vec2 RelativeCoord;
    vec2 Thickness;
    vec2 Fade;
} v_Rect;

void main()
{
    // 0 = texture, 1 = circle, 2 = rectangle, 3 = line
    int renderType = int(v_RenderType);

    switch (renderType) {
        case 0: {
            int index = int(v_Texture.TexIndex);
            o_Color = texture(u_Textures[index], v_Texture.TexCoord) * v_Color;
            break;

        } case 1: {
            float distance = 1.0 - length(v_Circle.LocalPosition);
            float alpha = smoothstep(0.0, v_Circle.Fade, distance);
            alpha *= smoothstep(v_Circle.Thickness + v_Circle.Fade, v_Circle.Thickness, distance);

            o_Color = v_Color;
            o_Color.a *= alpha;
            break;

        } case 2: {
            vec2 distance = vec2(1.0, 1.0) - abs(v_Rect.RelativeCoord);
            float alpha = smoothstep(0.0, v_Rect.Fade.x, distance.x) *
                smoothstep(0.0, v_Rect.Fade.y, distance.y);
            alpha *= max(smoothstep(v_Rect.Thickness.x + v_Rect.Fade.x, v_Rect.Thickness.x, distance.x),
                         smoothstep(v_Rect.Thickness.y + v_Rect.Fade.y, v_Rect.Thickness.y, distance.y));
            alpha = min(1.0, alpha);

            o_Color = v_Color;
            o_Color.a *= alpha;
            break;

        } case 3: {
            o_Color = v_Color;   
            break;
        }
    }
}
