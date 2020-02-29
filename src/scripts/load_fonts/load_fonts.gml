/// @function load_fonts
/// @description
///   Loads the fonts required by the game from the included files folder.
///

assert(
  file_exists("Assets/main_font.ttf"),
  "Failed to find the main font for the game, have you named it properly?"
);

assert(
  file_exists("Assets/title_font.ttf"),
  "Failed to find the title font for the game, have you named it properly?"
);

// TODO: Read settings from a file
global.main_font  = font_add("Assets/main_font.ttf" , 24, false, false, 32, 128);
global.title_font = font_add("Assets/title_font.ttf", 48, false, false, 32, 128);
