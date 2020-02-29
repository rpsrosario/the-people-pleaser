/// @function register_gamepad
/// @param index
///   The index of the gamepad to register.
/// @description
///   This function registers a given gamepad in the list of gamepads used for input.
///

var index = argument0;
if (gamepad_is_connected(index) && ds_list_find_index(global.gamepads, index) == -1) {
  ds_list_add(global.gamepads, index);
}
