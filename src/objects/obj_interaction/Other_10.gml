/// @description Move to next step

if (inc) current++;

if (current < ds_list_size(steps)) {
  instance_destroy(obj_rolling_text);
  instance_destroy(obj_answer);
  
  var step = steps[| current ];
  
  if (state == InteractionState.StepText) {
    create_rolling_text(step[? "text" ]);
  
    var answers = step[? "answers" ];
    if (ds_map_exists(answers, "0")) {
      instance_deactivate_object(
        create_neutral_answer(answers[? "0" ], action_do_neutral_answer)
      );
    } else {
      var positive = answers[? "+" ];
      instance_deactivate_object(
        create_positive_answer(positive[? "text" ], action_do_positive_answer)
      );
    
      var negative = answers[? "-" ];
      instance_deactivate_object(
        create_negative_answer(negative[? "text" ], action_do_negative_answer)
      );
    }
  } else {
    var answers   = step[? "answers" ];
    var answer    = answers[? last_answer ];
    var reactions = answer[? "reaction" ];
    var reaction  = undefined;
    switch (sign(last_score)) {
      case 1: {
        reaction = reactions[? "+" ];
      } break;
      
      case 0: {
        reaction = reactions[? "0" ];
      } break;
      
      case -1: {
        reaction = reactions[? "-" ];
      } break;
    }
    
    create_rolling_text(reaction);
    instance_deactivate_object(
      create_neutral_answer("...", action_do_neutral_answer)
    );
  }
} else {
  action_next_interaction();
}
