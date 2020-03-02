/// @function generate_character
/// @returns
///   A DS Map with the generated character data.
/// @description
///   Generates a character based on the character names and personality tags available.
///

var character = ds_map_create();
var tags      = ds_list_create();
ds_map_add_list(character, "tags", tags);

// TODO: Consider doing this only once
ds_list_shuffle(global.character_names);
character[? "name" ] = global.character_names[| 0];

// TODO: Consider doing this only once
ds_list_shuffle(global.personality_tags);
for (var t = 0; t < PLAYTHROUGH_TAG_COUNT; t++) {
  var group = global.personality_tags[| t];
  var tag   = irandom(ds_list_size(group) - 1);
  ds_list_add(tags, group[| tag ]);
}

return character;
