/// @function input_any_reply
/// @returns
///   Whether any input for either a positive or negative reply has been triggered.
/// @description
///   Checks for any input source: Mouse, Keyboard, Gamepad.
///

gml_pragma("forceinline");
return input_positive_reply() || input_negative_reply();
