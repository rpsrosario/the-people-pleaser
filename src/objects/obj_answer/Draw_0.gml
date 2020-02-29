/// @description Draw answer

draw_set_font(global.main_font);
draw_set_valign(fa_middle);
draw_set_halign(halign);

var dy = 7 * room_height / 8;
var dx = halign == fa_left  ? ANSWER_MARGIN :
         (halign == fa_right ? room_width - ANSWER_MARGIN :
                              room_width / 2);
                              
var width = halign == fa_center ? room_width - 2 * ANSWER_MARGIN :
                                  room_width / 2 - 2 * ANSWER_MARGIN;

if (state == AnswerState.ChoiceFadeIn) {
  var color = merge_color(c_black, c_red, alpha);
  switch (halign) {
    
    case fa_left: {
      draw_rectangle_color(0, 3 * room_height / 4, room_width / 2, room_height,
                           color, c_black, c_black, color,
                           false);
    } break;
    
    case fa_right: {
      draw_rectangle_color(room_width / 2, 3 * room_height / 4, room_width, room_height,
                           c_black, color, color, c_black,
                           false);
    } break;
    
    case fa_center: {
      draw_rectangle_color(0, 3 * room_height / 4, room_width, room_height,
                           c_black, c_black, color, color,
                           false);
    } break;
    
  }
}

draw_set_color(c_white);
draw_set_alpha(state != AnswerState.ChoiceFadeIn ? alpha : 1.00);
draw_text_ext(dx, dy, text, -1, width);
