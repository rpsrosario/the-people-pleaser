/// @function create_neutral_answer
/// @param text
///   Text for the answer
/// @param action
///   Action to execute when this answer is selected.
/// @returns
///   The ID of the created answer
/// @description
///   Creates a new neutral answer with the text supplied.
///

var text   = argument0;
var action = argument1;
var answer = instance_create_layer(0, 0, layer, obj_answer);

answer.halign = fa_center;
answer.text   = text;
answer.action = action;

return answer;
