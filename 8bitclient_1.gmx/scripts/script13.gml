var code=argument0;  // unique identifier
var label=argument1;
var purpose=argument2; // returned in "result" if pressed, "" if not
var ecks=argument3;  // top left x
var why=argument4;   // top left y
var style=argument5; // 0=standard, 1=spacebar, 2=return, 3=wide, 4=wider, 5=widest
var tint=argument6;
var label_tint=argument7;
var alpha=argument8;


var pressed=false;

// Determine if key is pressed

var mx=window_mouse_get_x();
var my=window_mouse_get_y();

if ( WITHIN(mx,my,
      ecks+khbx1[style],
      why+khby1[style],
      ecks+khbx2[style],
      why+khby2[style]) ) {
 if ( mouse_check_button(mb_any) ) {
  pressed=true;
 }
}

draw_sprite_ext(
 keysprite[style],0,
 ecks,why,

if ( pressed ) return purpose;
else return "";
