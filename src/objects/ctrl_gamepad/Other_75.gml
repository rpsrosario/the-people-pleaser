/// @description Handle gamepad states

switch (async_load[? "event_type"]) {
  
  case "gamepad discovered": {
    register_gamepad(async_load[? "pad_index"]);
  } break;
  
  case "gamepad lost": {
    unregister_gamepad(async_load[? "pad_index"]);
  } break;
  
}
