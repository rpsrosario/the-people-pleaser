/// @description Check timeout

if (!instance_exists(obj_answer)) {
  timeout += delta_time;
  if (timeout >= TITLE_TIMEOUT) {
    create_positive_answer("Play", action_game_start);
    create_negative_answer("Quit", action_game_end);
  }
}
