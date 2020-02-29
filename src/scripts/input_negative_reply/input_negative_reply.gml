/// @function input_negative_reply
/// @returns
///   Whether any input for a negative reply has been triggered.
/// @description
///   Checks for any input source: Mouse, Keyboard, Gamepad.
///

if (mouse_check_button_released(mb_left) && mouse_in_negative_answer()) {
  return true;
}

if (keyboard_released("A", vk_left, "1")) {
  return true;
}

var gamepad = 0;
var gamepad_count = ds_list_size(global.gamepads);
repeat (gamepad_count) {
  if (!gamepad_is_connected(gamepad)) {
    unregister_gamepad(gamepad);
    continue;
  }
  
  var triggered = false;
  triggered |= gamepad_axis_value(gamepad, gp_axislh) <= -GAMEPAD_THRESHOLD;
  triggered |= gamepad_axis_value(gamepad, gp_axisrh) <= -GAMEPAD_THRESHOLD;
  triggered |= gamepad_button_value(gamepad, gp_shoulderlb) <= -GAMEPAD_THRESHOLD;
  triggered |= gamepad_button_value(gamepad, gp_shoulderrb) <= -GAMEPAD_THRESHOLD;
  triggered |= gamepad_released(gamepad, gp_padl, gp_stickl, gp_face2);
  if (triggered) {
    return true;
  }
  
  gamepad++;
}

return false;
