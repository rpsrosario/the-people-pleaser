/// @description Draw the game title

draw_set_font(global.title_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_red);
draw_text(room_width / 2, room_height / 2, "The People Pleaser");
