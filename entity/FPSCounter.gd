extends Label

func _process(delta):
  set_text(String.num_int64(Engine.get_frames_per_second()))
