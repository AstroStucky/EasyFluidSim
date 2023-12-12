extends Label

func _process(delta):
  set_text(String.num(ParticleCounter.count))
