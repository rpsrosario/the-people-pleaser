/// @function register_gamepad_support
/// @description
///   Prepares the required state for gamepad support.
///

#macro GAMEPAD_THRESHOLD 0.85

global.gamepads = ds_list_create();
