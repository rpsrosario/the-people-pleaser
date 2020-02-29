/// @function unregister_gamepad
/// @param index
///   The index of the gamepad to unregister.
/// @description
///   This function unregisters a given gamepad in the list of gamepads used for input.
///

var gamepad = argument0;

var index = ds_list_find_index(global.gamepads, gamepad);
if (index != -1) {
  ds_list_delete(global.gamepads, index);
}
