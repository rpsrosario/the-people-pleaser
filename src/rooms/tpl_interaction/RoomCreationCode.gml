var intro = global.static_text[? "intro" ];
create_rolling_text(intro[? "text" ]);
instance_deactivate_object(
  create_neutral_answer(intro[? "answer" ], action_next_room)
);
