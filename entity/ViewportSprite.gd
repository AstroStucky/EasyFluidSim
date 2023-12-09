extends Sprite2D

@export var alpha_threshold : float = 0.2 : set = _set_alpha_threshold

func _set_alpha_threshold(value : float):
  alpha_threshold = value
  get_material().set_shader_parameter("alpha_threshold", alpha_threshold)

