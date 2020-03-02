var message = "";

var count  = ds_list_size(ctrl_playthrough.characters);
var tscore = 0;
for (var c = 0; c < count; c++) {
  var character = ctrl_playthrough.characters[| c ];
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
instance_destroy(ctrl_playthrough);

create_rolling_text(message);
instance_deactivate_object(
  create_neutral_answer("Cool!", action_game_restart)
);
