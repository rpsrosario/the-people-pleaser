/// @function keyboard_released
/// @param keys...
///   The keys to check for being released.
/// @returns
///   Whether any of the keys supplied were released.
/// @description
///   In case a letter is to be checked there is no need to use ord().
///

for (var k = 0; k < argument_count; k++) {
  var keycode = is_string(argument[k]) ? ord(argument[k]) : argument[k];
  if (keyboard_check_released(keycode)) {
    return true;
  }
}

return false;
