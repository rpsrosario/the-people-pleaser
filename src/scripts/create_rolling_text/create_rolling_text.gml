/// @function create_rolling_text
/// @param text
///   Text for the rolling text
/// @returns
///   The ID of the created rolling text
/// @description
///   Creates a new rolling text with the text supplied.
///

var text = argument0;

draw_set_font(global.main_font); // For height calculation

var rolling_text    = instance_create_layer(0, 0, "Instances", obj_rolling_text);
rolling_text.text   = text;
rolling_text.length = string_length(text);
rolling_text.height = string_height_ext(text, -1, room_width - 2 * ROLLING_TEXT_MARGIN);

return rolling_text;
