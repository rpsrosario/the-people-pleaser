/// @function register_gamepad_support
/// @description
///   Prepares the required state for gamepad support.
///

#macro GAMEPAD_THRESHOLD 0.85

global.gamepads = ds_list_create();
instance_create_layer(0, 0, "Instances", ctrl_gamepad);
