#version 410 core

layout (location = 0) out vec4 o_Color;

in vec2 v_LocalPosition;
in vec4 v_Color;
in vec2 v_Thickness;
in vec2 v_Fade;

void main()
{
    // 0.0 if inside rectangle, 1.0 if on edge
    vec2 distance = vec2(1.0, 1.0) - abs(v_LocalPosition);
    float alpha = smoothstep(0.0, v_Fade.x, distance.x) *
                  smoothstep(0.0, v_Fade.y, distance.y);
    alpha *= max(smoothstep(v_Thickness.x + v_Fade.x, v_Thickness.x, distance.x),
                 smoothstep(v_Thickness.y + v_Fade.y, v_Thickness.y, distance.y));
    alpha = min(1.0, alpha);

    o_Color = v_Color;
    o_Color.a *= alpha;
}