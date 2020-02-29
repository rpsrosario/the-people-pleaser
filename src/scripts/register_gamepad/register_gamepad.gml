/// @function register_gamepad
/// @param gamepad
///   The index of the gamepad to register.
/// @description
///   This function registers a given gamepad in the list of gamepads used for input.
///

var gamepad = argument0;
if (gamepad_is_connected(gamepad) && ds_list_find_index(global.gamepads, gamepad) == -1) {
  ds_list_add(global.gamepads, gamepad);
}
