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

// Index terms for faster iteration / shuffling
var category = ds_map_find_first(json);
while (!is_undefined(category)) {
  var terms = json[? category ];
  var term  = ds_map_find_first(terms);
  
  var term_index = ds_list_create();
  while (!is_undefined(term)) {
    ds_list_add(term_index, term);
    term = ds_map_find_next(terms, term);
  }
  ds_map_add_list(terms, ".index", term_index);
  
  category = ds_map_find_next(json, category);
}
