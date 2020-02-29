/// @function initialize_term_database
/// @description
///   This function performs the necessary steps in order to initialize all of the terms and how each
///   personality tag feels towards it.
///

assert(
  file_exists("Data/terms.json"),
  "Failed to find the data file for the terms database, have you named it properly?"
);

var buffer = buffer_load("Data/terms.json");
assert(buffer >= 0, "Failed to load the terms database file");

var json = json_decode(buffer_read(buffer, buffer_text));
assert(json >= 0, "Failed to decode the terms database JSON payload");

buffer_delete(buffer);
global.terms_database = json;
