/// @description Generate game state

#macro PLAYTHROUGH_CHARACTER_COUNT 2
#macro PLAYTHROUGH_TAG_COUNT 2
#macro PLAYTHROUGH_INTERACTION_COUNT 4

characters = ds_list_create();
for (var c = 0; c < PLAYTHROUGH_CHARACTER_COUNT; c++) {
  ds_list_add(characters, generate_character());
  ds_list_mark_as_map(characters, c);
}

interactions = ds_list_create();
lookup       = ds_map_create();
current      = 0;

var interaction_count = ds_list_size(global.interactions);
for (var i = 0; i < PLAYTHROUGH_INTERACTION_COUNT; i++) {
  var index = i % interaction_count;
  
  var interaction = generate_interaction(index);
  var the_room    = room_duplicate(tpl_interaction);
  var instance    = room_instance_add(the_room, 0, 0, obj_interaction);
  
  ds_list_add(interactions, the_room);
  lookup[? instance ] = interaction;
}
