/// @description Negative Answer

var step      = steps[| current ];
var character = step[? "character" ];

character[? "feeling" ] -= step[? "score" ];

action_next_step();
