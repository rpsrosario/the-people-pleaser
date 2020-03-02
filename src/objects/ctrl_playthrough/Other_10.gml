/// @description Next Interaction

if (++current < ds_list_size(interactions)) {
  room_goto(interactions[| current]);
} else {
  room_goto(rm_score);
}
