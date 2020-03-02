/// @description Positive Answer

var step      = steps[| current ];
var character = step[? "character" ];

last_answer = "+";
last_score  = step[? "score" ]
character[? "feeling" ] += last_score;

state = InteractionState.StepReaction;
inc   = false;
action_next_step();
