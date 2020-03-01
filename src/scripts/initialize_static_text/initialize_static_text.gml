/// @function initialize_static_text
/// @description
///   This function performs the necessary steps in order to initialize all of the static text used
///   throughout the game.
///

assert(
  file_exists("Data/static-text.json"),
  "Failed to find the data file for the static text snippets, have you named it properly?"
);

var buffer = buffer_load("Data/static-text.json");
assert(buffer >= 0, "Failed to load the static text snippets file");

var json = json_decode(buffer_read(buffer, buffer_text));
assert(json >= 0, "Failed to decode the static text snippets JSON payload");

buffer_delete(buffer);
global.static_text = json;
