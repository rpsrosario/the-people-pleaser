/// @function initialize_personality_tags
/// @description
///   This function performs the necessary steps in order to initialize all of the possible tags that
///   make up a character's personality along with how they relate to each other.
///

assert(
  file_exists("Data/tags.json"),
  "Failed to find the data file for the personality tags, have you named it properly?"
);

var buffer = buffer_load("Data/tags.json");
assert(buffer >= 0, "Failed to load the personality tags file");

var json = json_decode(buffer_read(buffer, buffer_text));
assert(json >= 0, "Failed to decode the personality tags JSON payload");

buffer_delete(buffer);
global.personality_tags = json[? "default"];

ds_map_delete(json, "default");
ds_map_destroy(json);
