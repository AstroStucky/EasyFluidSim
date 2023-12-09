extends Node

var count : int = 0

func increment():
  count += 1

func decrement():
  count -= 1

func clear_all_particles():
  count = 0
  for node in get_tree().get_nodes_in_group("FluidParticle"):
    node.queue_free()
