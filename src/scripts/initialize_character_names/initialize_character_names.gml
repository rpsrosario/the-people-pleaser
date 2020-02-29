/// @function initialize_character_names
/// @description
///   This function performs the necessary steps in order to initialize all of the possible names that
///   the characters might have.
///

assert(
  file_exists("Data/names.json"),
  "Failed to find the data file for the character names, have you named it properly?"
);

var buffer = buffer_load("Data/names.json");
assert(buffer >= 0, "Failed to load the character names file");

var json = json_decode(buffer_read(buffer, buffer_text));
assert(json >= 0, "Failed to decode the character names JSON payload");

buffer_delete(buffer);
global.character_names = json[? "default"];

ds_map_delete(json, "default");
ds_map_destroy(json);
