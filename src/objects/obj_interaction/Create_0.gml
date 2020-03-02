/// @description Setup interaction

enum InteractionState {
  StepText,
  StepReaction,
}

steps       = ctrl_playthrough.lookup[? id ];
current     = -1;
inc         = true;
state       = InteractionState.StepText;
last_score  = 0;
last_answer = 0;

event_perform(ev_other, ev_user0);
