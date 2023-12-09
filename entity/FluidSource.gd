extends Marker2D

var FluidParticle : PackedScene = preload("res://entity/FluidParticle.tscn")

@export var spray : float = 5.0
@export var spout_flow_speed : float = 50.0

@export var fluid_viewport_path : NodePath

var particle_rate : float : set = _set_particle_rate
func _set_particle_rate(value : float):
  particle_rate = value
  $Timer.set_wait_time(1.0 / particle_rate)

var particle_radius : float : set = _set_particle_radius
func _set_particle_radius(value : float):
  particle_radius = value
  update_particle_properties()

var particle_bounce : float : set = _set_particle_bounce
func _set_particle_bounce(value : float):
  particle_bounce = value
  update_particle_properties()

var particle_friction : float: set = _set_particle_friction
func _set_particle_friction(value : float):
  particle_friction = value
  update_particle_properties()

@onready var fluid_viewport : SubViewport = get_node(fluid_viewport_path)

func _ready():
  update_particle_properties()
  $Timer.set_wait_time(1.0 / particle_rate)
  $Timer.timeout.connect(spawn)

func _on_timeout():
  spawn()

func update_particle_properties():
  var particle : RigidBody2D = FluidParticle.instantiate()
  particle.get_node("CollisionShape2D").get_shape().radius = particle_radius
  var mat := particle.get_physics_material_override()
  mat.bounce = particle_bounce
  mat.friction = particle_friction

func spawn():
  var particle : RigidBody2D = FluidParticle.instantiate()
  particle.set_position(global_position)
  # randomize lateral velocity
  particle.set_linear_velocity(Vector2(randf_range(-spray, spray), spout_flow_speed))
  fluid_viewport.add_child(particle)
  ParticleCounter.increment()

func activate():
  $Timer.start()

func deactivate():
  $Timer.stop()
