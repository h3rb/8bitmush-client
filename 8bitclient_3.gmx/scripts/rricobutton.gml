var ecks=argument0;
var why=argument1;
var icon=argument2;
var sprite=argument3;
var activated=argument4;
var mx=mouse_x;
var my=mouse_y;

var icow=sprite_get_width(icon);
var icoh=sprite_get_height(icon);

var hovering=WITHIN(mx,my,ecks,why,ecks+icow,why+icoh);

draw_set_blend_mode(bm_normal);
draw_set_alpha(1);

if ( activated ) {
 draw_set_color(c_orange);
 draw_roundrect(ecks-4,why-4,ecks+icow+4,why+icoh+4,false);
}
if ( hovering ) {
 draw_roundrect_color(ecks,why,ecks+icow,why+icoh,make_color_rgb(1,1,255),make_color_rgb(24,52,200),false);
} else {
 draw_roundrect_color(ecks,why,ecks+icow,why+icoh,make_color_rgb(64,64,255),make_color_rgb(124,152,200),false);
}

if ( hovering and mouse_check_button(mb_any) ) {
 draw_set_color(c_aqua);
 draw_set_blend_mode(bm_add);
 draw_sprite_ext(s_glow_additive,sprite,ecks+icow/2,why+icoh/2,0.5,0.5,mouse_y+mouse_x,c_aqua,0.5);
 draw_set_blend_mode(bm_normal);
}

draw_sprite_ext(icon,sprite,ecks,why,1,1,0,c_white,1);

return hovering;
