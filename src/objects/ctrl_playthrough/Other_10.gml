/// @description Next Interaction

if (++current < ds_list_size(interactions)) {
  room_goto(interactions[| current]);
} else {
  // TODO: Goto score, etc
  show_message("FINISHED");
}
