var code=argument0;  // unique identifier
var label=argument1;
var ecks=argument2;  // top left x
var why=argument3;   // top left y
var style=argument4; // 0=standard, 1=spacebar, 2=return, 3=wide, 4=wider, 5=widest
var tint=argument5;
var label_tint=argument6; // FANSI color code
var alpha=argument7;
var labelhofs=argument8;  // insert half the precomputed returned value from write_fansi_width
var rmx=argument9; // relative mouse x *calculated by the window*
var rmy=argument10; // relative mouse y

// Determine if key is pressed
var pressed=false;

var font=s_fansi_font;
if ( global.double_sized_keyboard ) font=s_fansi_font_big;

if ( WITHIN(rmx,rmy,
      ecks+global.khbx1[style],
      why+global.khby1[style],
      ecks+global.khbx2[style],
      why+global.khby2[style]) ) {
 if ( mouse_check_button(mb_any) ) {
  pressed=true;
 }
}

global.key_waspressed[code]=global.key_pressed[code];
global.key_pressed[code]=pressed;

if ( pressed and not global.key_waspressed[code] ) {
 audio_play_sound(global.keysound[style],100,0);
}

var sw=1;
if ( global.keyboard_scale != 1 and global.keyboard_scale != 2 )
 sw=1*(global.keyboard_scale/2);
if ( pressed ) {
 draw_sprite_ext(
  global.keysprite[style],0,
  ecks,why+7*global.keyboard_scale,
  sw,sw,
  0,tint,alpha
 );
 write_fansi(
  label,
  font, 1.0, 
  ecks+global.klcx[style]-labelhofs,
  why+global.klcy[style]+7*global.keyboard_scale,
  label_tint, -1,
  0, alpha, -1
 );
} else {
 draw_sprite_ext(
  global.keysprite[style],0,
  ecks,why,
  sw,sw,
  0,tint,alpha
 );
 write_fansi(
  label,
  font, 1.0, 
  ecks+global.klcx[style]-labelhofs,
  why+global.klcy[style],
  label_tint, -1,
  0, alpha, -1
 );
}

return pressed;
