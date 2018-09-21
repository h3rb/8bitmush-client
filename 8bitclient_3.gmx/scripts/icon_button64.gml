var ecks=argument0;
var why=argument1;
var icon=argument2;
var mx=argument3;
var my=argument4;

var hovering=WITHIN(mx,my,ecks,why,ecks+sprite_get_width(icon),why+sprite_get_height(icon));

draw_set_blend_mode(bm_normal);
draw_set_alpha(1);

draw_sprite_ext(icon,0,ecks,why,1,1,0,c_white,1);

if ( hovering ) {
 draw_set_color(c_aqua);
 draw_set_blend_mode(bm_add);
 draw_sprite_ext(s_glow_additive,0,ecks+32,why+32,0.5,0.5,mouse_x+mouse_y,c_white,0.5);
 draw_set_blend_mode(bm_normal);
 draw_set_color(c_white);
}

return hovering;
