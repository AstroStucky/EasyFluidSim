shader_type canvas_item;
render_mode blend_add;

uniform float alpha_threshold : hint_range(0, 1);
uniform vec4 swap_color : source_color = vec4(1.0);

void fragment () {
    COLOR = texture(TEXTURE, UV);
    if (COLOR.a < alpha_threshold) {
        COLOR.a = 0.0;
    } else {
        COLOR = swap_color;
    }
}