/// @description Move to next step


if (++current < ds_list_size(steps)) {
  instance_destroy(obj_rolling_text);
  instance_destroy(obj_answer);
  
  var step = steps[| current ];
  create_rolling_text(step[? "text" ]);
  
  var answers = step[? "answers" ];
  if (ds_map_exists(answers, "0")) {
    instance_deactivate_object(
      create_neutral_answer(answers[? "0" ], action_next_step)
    );
  } else {
    // TODO: Calculate score & whatnot
    
    var positive = answers[? "+" ];
    instance_deactivate_object(
      create_positive_answer(positive[? "text" ], action_next_step)
    );
    
    var negative = answers[? "-" ];
    instance_deactivate_object(
      create_negative_answer(negative[? "text" ], action_next_step)
    );
  }
} else {
  action_next_interaction();
}
