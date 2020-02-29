/// @description Setup an answer

#macro ANSWER_MARGIN 48
#macro ANSWER_FADEIN_TIMEOUT   2000000
#macro ANSWER_GRADIENT_TIMEOUT  250000

enum AnswerState {
  FadeIn,
  WaitingChoice,
  ChoiceFadeIn,
}

halign = undefined;
text   = undefined;
action = undefined;

alpha = 0.25;
state = AnswerState.FadeIn;
