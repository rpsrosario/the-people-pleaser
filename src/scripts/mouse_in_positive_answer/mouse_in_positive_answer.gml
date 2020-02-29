/// @function mouse_in_positive_answer
/// @returns
///   Whether or not the mouse is inside the positive answer area.
/// @description
///   The positive answer area is the second half of the bottom quarter of the screen.
///

gml_pragma("forceinline");
return mouse_in_rectangle(room_width / 2 + 1, 3 * room_height / 4, room_width, room_height);
