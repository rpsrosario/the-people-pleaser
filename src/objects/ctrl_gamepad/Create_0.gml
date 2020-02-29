/// @description Discover connected gamepads

for (var g = 0; g < gamepad_get_device_count(); g++) {
  register_gamepad(g);
}
