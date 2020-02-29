/// @function mouse_in_rectangle
/// @param x1
///   The x-coordinate of the top-left corner of the rectangle.
/// @param y1
///   The y-coordinate of the top-left corner of the rectangle.
/// @param x2
///   The x-coordinate of the bottom-right corner of the rectangle.
/// @param y2
///   The y-coordinate of the bottom-right corner of the rectangle.
/// @returns
///   True if the mouse is in the rectangle bounds given.
/// @description
///   Same as calling point_in_rectangle with the mouse coordinates.
///

gml_pragma("forceinline");
return point_in_rectangle(mouse_x, mouse_y, argument0, argument1, argument2, argument3);
