extends Area2D

@export var fluid_viewport_path : NodePath

func _ready():
  body_entered.connect(_on_body_entered)
  call_deferred("reparent", get_node(fluid_viewport_path))

func _on_body_entered(body):
  if body is RigidBody2D:
    body.queue_free()
    ParticleCounter.decrement()

