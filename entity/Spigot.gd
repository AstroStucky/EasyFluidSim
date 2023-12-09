extends Area2D

@export var activate_path : NodePath

@onready var sprite : AnimatedSprite2D = get_node("AnimatedSprite2D")

func _input_event(_viewport : Viewport, event : InputEvent, _shape_idx : int):
  if not event is InputEventMouseButton or activate_path.is_empty():
    return # ignore invalid input or activation path
  # print("TEST")
  if event.is_pressed() and event.button_mask == MOUSE_BUTTON_MASK_LEFT:
    if sprite.animation == "close":
      get_node(activate_path).activate()
      sprite.play("open")
    else:
      get_node(activate_path).deactivate()
      sprite.play("close")
