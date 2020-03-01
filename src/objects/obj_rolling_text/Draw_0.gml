/// @description Draw rolling text

var segment = string_copy(text, 1, current);

draw_set_font(global.main_font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white);
draw_set_alpha(1.00);
draw_text_ext(ROLLING_TEXT_MARGIN, (3 * room_height / 4 - height) / 2,
              segment, -1, room_width - 2 * ROLLING_TEXT_MARGIN);
