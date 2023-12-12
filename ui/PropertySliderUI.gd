extends HSlider

@export var mod_group : String
@export var mod_prop : String

func _ready():
  propogate_value(value)

func _value_changed(new_value : float):
  propogate_value(new_value)

func propogate_value(new_value : float):
  get_node("../SliderValue").text = String.num(new_value)
  for node in get_tree().get_nodes_in_group(mod_group):
    node.set(mod_prop, new_value)
