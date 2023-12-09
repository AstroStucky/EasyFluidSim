extends Polygon2D

@export var fluid_viewport_path : NodePath

func _ready():
  call_deferred("viewport_duplicate_to_static_body")

func viewport_duplicate_to_static_body():
  var body_dupe := StaticBody2D.new()
  body_dupe.set_transform(transform)
  var collision_shape := CollisionPolygon2D.new()
  collision_shape.set_polygon(get_polygon())
  var test = get_node(fluid_viewport_path)
  test.add_child(body_dupe)
  body_dupe.add_child(collision_shape)
