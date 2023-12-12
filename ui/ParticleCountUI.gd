extends Label

func _process(delta):
  set_text(String.num_int64(ParticleCounter.count).pad_zeros(5))
