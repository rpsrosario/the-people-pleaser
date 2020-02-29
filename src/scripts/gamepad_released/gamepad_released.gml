/// @function gamepad_released
/// @param gamepad
///   The index of the gamepad to check.
/// @param buttons...
///   The buttons to check for being released.
/// @returns
///   Whether any of the buttons supplied were released.
/// @description
///   Checks the buttons without validating if the gamepad is connected.
///

var gamepad = argument[0];
for (var b = 1; b < argument_count; b++) {
  if (gamepad_button_check_released(gamepad, argument[b])) {
    return true;
  }
}

return false;
