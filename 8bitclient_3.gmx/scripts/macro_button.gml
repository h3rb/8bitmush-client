var macro=argument0;
var ecks=argument1;
var why=argument2;
var mx=argument3;
var my=argument4;

var w=64*5-32;
var h=42;

var label=global.terminal.macro[macro];

var hovering= WITHIN(mx,my,ecks,why,ecks+w,why+h);
if ( hovering ) {
 draw_set_color(c_red);
} else if ( global.terminal.macro_is_selected == macro ) {
 draw_set_color(c_orange);
} else draw_set_color(c_dkgray);

if ( global.terminal.macro_send[macro] ) {
 draw_roundrect(ecks,why,ecks+w,why+h,false);
} else {
 draw_rectangle(ecks,why,ecks+w,why+h,false);
 draw_set_color(c_lime);
 draw_rectangle(ecks,why,ecks+w,why+h,true);
}

var wrap_limit = 64*5-48;
write_fansi(label,s_fansi_font_big,1,ecks+3,why+3,118,-1,0,1,wrap_limit);

return hovering;
