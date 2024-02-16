extends Node;

var audio_player_pool : Array[AudioStreamPlayer] = [];
var audio_player_map = {};
var audio_index : int = 0;

func play_sound(audio_stream : AudioStream, loop : bool = false) -> int:
	var audio_player : AudioStreamPlayer;
	if (audio_player_pool.is_empty()) :
		audio_player = AudioStreamPlayer.new();
		self.add_child(audio_player);
		audio_player.finished.connect(audio_stop_self.bind(audio_player));
	else :
		audio_player = audio_player_pool.pop_back();
		audio_player.process_mode = PROCESS_MODE_INHERIT;
	audio_player.set_meta("loop", loop);
	audio_player.set_meta("audio_playid", audio_index);
	audio_player.stream = audio_stream;
	audio_player.play();
	audio_player_map[audio_index] = audio_player;
	audio_index += 1;
	return audio_index - 1;

var audio_stop_self : Callable = func(player) -> void:
	var loop : bool = player.get_meta("loop");
	if (loop) :
		player.play();
		return;
	var playing_id : int = player.get_meta("audio_playid");
	audio_player_map.erase(playing_id);
	audio_player_pool.push_back(player);

func stop_sound(playing_id : int) -> void :
	if (audio_player_map.has(playing_id)) :
		var audio_player : AudioStreamPlayer = audio_player_map[playing_id];
		audio_player_map.erase(playing_id);
		audio_player_pool.push_back(audio_player);
		audio_player.stop();
		audio_player.process_mode = Node.PROCESS_MODE_DISABLED;
	else :
		return;
	pass;

func sound_set_volume(playing_id : int, volume : int) -> void :
	if (audio_player_map.has(playing_id)) :
		audio_player_map[playing_id].volume_db = volume;

# 待重写
