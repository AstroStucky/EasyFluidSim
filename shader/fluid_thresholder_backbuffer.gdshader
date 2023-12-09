shader_type canvas_item;
render_mode blend_add;

uniform float alpha_threshold : hint_range(0, 1);
uniform vec4 fluid_color : source_color = vec4(1.0);
uniform vec4 swap_color : source_color = vec4(1.0);
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment () {
    COLOR = textureLod(screen_texture, SCREEN_UV, 0.0);
    if (COLOR.rgb == swap_color.rgb) {
      COLOR = fluid_color;
      if (COLOR.a < alpha_threshold) {
          COLOR.a = 0.0;
      } else {
        COLOR.a = 1.0;
      }
    }
//    COLOR = vec4(1, 0, 0, 1);
}