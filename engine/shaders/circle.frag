#version 410 core

layout (location = 0) out vec4 o_Color;

in vec2 v_LocalPosition;
in vec4 v_Color;
in float v_Thickness;
in float v_Fade;

void main()
{
    float distance = 1.0 - length(v_LocalPosition);
    float alpha = smoothstep(0.0, v_Fade, distance);
    alpha *= smoothstep(v_Thickness + v_Fade, v_Thickness, distance);

    o_Color = v_Color;
    o_Color.a *= alpha;
}