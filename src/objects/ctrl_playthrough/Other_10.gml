/// @description Next Interaction

if (++current < ds_list_size(interactions)) {
  room_goto(interactions[| current]);
} else {
  // TODO: Goto score room
  var message = "";
  
  var count  = ds_list_size(characters);
  var tscore = 0;
  for (var c = 0; c < count; c++) {
    var character = characters[| c ];
    message += character[? "name" ];
    
    switch (sign(character[? "feeling" ])) {
      case 1: {
        message += " likes you";
      } break;
      
      case 0: {
        message += " has no feeling towards you";
      } break;
      
      case -1: {
        message += " dislikes you";
      } break;
    }
    
    message += "\n";
    tscore  += character[? "feeling" ];
  }
  
  message += "\nScore: " + string(tscore);
  show_message(message);
  instance_destroy();
}
