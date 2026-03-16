extends CanvasLayer

func changeScene(target:String) -> void:
	$AnimationPlayer.play("FadeToBlack")
	await $AnimationPlayer.animation_finished
	get_tree().call_deferred("change_scene_to_file", target)
