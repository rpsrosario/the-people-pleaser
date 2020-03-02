/// @description Cleanup

ds_list_destroy(characters);
ds_list_destroy(interactions);
ds_map_destroy(lookup);

room_goto(rm_menu);
