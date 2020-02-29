/// @function mouse_in_negative_answer
/// @returns
///   Whether or not the mouse is inside the negative answer area.
/// @description
///   The negative answer area is the first half of the bottom quarter of the screen.
///

gml_pragma("forceinline");
return mouse_in_rectangle(0, 3 * room_height / 4, room_width / 2, room_height);
