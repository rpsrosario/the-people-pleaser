/// @description Process answer

switch (state) {
 
  case AnswerState.FadeIn: {
    alpha = min(1.00, alpha + delta_time / ANSWER_FADEIN_TIMEOUT);
    if (alpha >= 1.00) {
      state = AnswerState.WaitingChoice;
    }
  } break;
 
  case AnswerState.ChoiceFadeIn: {
    alpha = min(1.00, alpha + delta_time / ANSWER_GRADIENT_TIMEOUT);
    if (alpha >= 1.00) {
      instance_destroy(obj_answer);
    }
  } break;

}

var any_selected = false;
with (obj_answer) {
  any_selected |= state == AnswerState.ChoiceFadeIn;
}

if (!any_selected) {
  var trigger = false;
  trigger |= halign == fa_left && input_negative_reply();
  trigger |= halign == fa_right && input_positive_reply();
  trigger |= halign == fa_center && input_any_reply();
  if (trigger) {
    alpha = 0.00;
    state = AnswerState.ChoiceFadeIn;
  }
}
