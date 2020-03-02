/// @function initialize_interactions
/// @description
///   This function performs the necessary steps in order to initialize all of the possible interactions
///   that might occur with characters.
///

assert(
  file_exists("Data/interactions.json"),
  "Failed to find the data file for the interactions, have you named it properly?"
);

var buffer = buffer_load("Data/interactions.json");
assert(buffer >= 0, "Failed to load the interactions file");

var json = json_decode(buffer_read(buffer, buffer_text));
assert(json >= 0, "Failed to decode the interactions JSON payload");

buffer_delete(buffer);
global.interactions = json[? "default"];

ds_map_delete(json, "default");
ds_map_destroy(json);
