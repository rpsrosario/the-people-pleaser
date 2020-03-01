/// @description Show text slowly

if (input_any_reply()) {
  current = length;
}

if (current < length) {
  time    += delta_time;
  current  = min(length, current + (time div ROLLING_TEXT_LETTER));
  time     = time mod ROLLING_TEXT_LETTER;
} else if (instance_number(obj_answer) == 0) {
  instance_activate_object(obj_answer);
}
