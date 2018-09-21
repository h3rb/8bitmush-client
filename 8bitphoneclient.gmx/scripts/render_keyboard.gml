var ecks=argument0;
var why=argument1;
var w=argument2;
var h=argument3;
                   
var i,len;

var typing=false;

var secondrowbaseindent=(sprite_get_width(s_key_wide)-13)*global.keyboard_scale;
var indent=13*global.keyboard_scale;
var keyrow=(sprite_get_height(s_key)-4)*global.keyboard_scale;
var keywidth=sprite_get_width(s_key)*global.keyboard_scale;
var mx=window_mouse_get_x(); // change to rmx, rmy using surfaces
var my=window_mouse_get_y();
//var rmx=(mx-ecks)/w;
//var rmy=(my-why)/h;

var shifted= global.key_pressed[265] or global.key_pressed[260] or global.shiftlock;

dx=0;

var row0;
if ( not shifted ) row0="`1234567890-=";
else row0="~!@#$%^&*()_+";
len=string_length(row0);

for ( i=0; i<len; i++ ) {
 var c=string_char_at(row0,i+1);
 render_key(
  ord(c), c, 
  ecks+dx, why, 0, c_green, 15, 1, 
  write_fansi_width( c, s_fansi_font, 1.0, -1 )/2,
  mx,my
 );
 dx+=sprite_get_width( global.keysprite[0] );
}

render_key( // Backspace
 256, chr(27),
 ecks+(keywidth*string_length(row0)),
 why,
 3, c_teal, 254, 1,
 write_fansi_width( "1", s_fansi_font, 1.0, -1 )/2,
 mx,my
);

render_key( // Tab
 258, "TAB",
 ecks,
 why+keyrow,
 3, c_dkgray, 254, 1,
 write_fansi_width( "TAB", s_fansi_font, 1.0, -1 )/2,
 mx,my
);

var row1;
if ( shifted ) row1="QWERTYUIOP{}|";
else if ( global.caps ) row1="QWERTYUIOP[]\";
else row1="qwertyuiop[]\";
len=string_length(row1);

var dx=secondrowbaseindent+indent;
var dy=keyrow;

for ( i=0; i<len; i++ ) {
 var c=string_char_at(row1,i+1);
 typing = typing and not render_key(
  ord(c), c, 
  ecks+dx, why+dy, 0, c_orange, 0, 1, 
  write_fansi_width( c, s_fansi_font, 1.0, -1 )/2,
  mx,my
 );
 dx+=sprite_get_width( global.keysprite[0] );
}

typing = typing and not render_key( // Caps Lock
 259, "CAPS",
 ecks,
 why+keyrow*2,
 4, c_dkgray, 202, 1,
 write_fansi_width( "CAPS", s_fansi_font, 1.0, -1 )/2,
 mx,my
);

var row2;
if ( shifted ) row2="ASDFGHJKL:"+'"';
else if ( global.caps ) row2="ASDFGHJKL;'";
else row2="asdfghjkl;'";

len=string_length(row2);

dx=secondrowbaseindent+indent*2-5;
dy+=keyrow;

for ( i=0; i<len; i++ ) {
 var c=string_char_at(row2,i+1);
 typing = typing and not render_key(
  ord(c), c, 
  ecks+dx, why+dy, 0, c_orange, 0, 1, 
  write_fansi_width( c, s_fansi_font, 1.0, -1 )/2,
  mx,my
 );
 dx+=sprite_get_width( global.keysprite[0] );
}

typing = typing and not render_key( // Left Shift
 260, "SHIFT",
 ecks,
 why+keyrow*3,
 5, c_dkgray, 9, 1,
 write_fansi_width( "SHIFT", s_fansi_font, 1.0, -1 )/2,
 mx,my
);

var row3;
if ( shifted ) row3="ZXCVBNM<>?";
else if ( global.caps ) row3="ZXCVBNM,./";
else row3="zxcvbnm,./";
len=string_length(row3);

dx=secondrowbaseindent+indent*3-6;
dy+=keyrow;

for ( i=0; i<len; i++ ) {
 var c=string_char_at(row3,i+1);
 typing = typing and not render_key(
  ord(c), c, 
  ecks+dx, why+dy, 0, c_orange, 0, 1, 
  write_fansi_width( c, s_fansi_font, 1.0, -1 )/2,
  mx,my
 );
 dx+=sprite_get_width( global.keysprite[0] );
}


typing = typing and not render_key( // Enter
 13, "RETURN",
 ecks+secondrowbaseindent+(keywidth*string_length(row2))+indent*2-5,
 why+keyrow*2-1,
 2, c_teal, 254, 1,
 write_fansi_width( "RETURN", s_fansi_font, 1.0, -1 )/2,
 mx,my
);

typing = typing and not render_key( // Shift-Lock
 257, chr(15),
 ecks+secondrowbaseindent+(keywidth*string_length(row3))+indent*3-6,
 why+keyrow*3,
 0, c_red, 254, 1,
 write_fansi_width( "1", s_fansi_font, 1.0, -1 )/2,
 mx,my
);


// Bottom Row Specialty Keys

typing = typing and not render_key( // Left CTRL
 261, "CTRL",
 ecks,
 why+keyrow*4,
 3, c_dkgray, 202, 1,
 write_fansi_width( "CTRL", s_fansi_font, 1.0, -1 )/2,
 mx,my
);

typing = typing and not render_key( // Smiley Button
 262, chr(2),
 ecks+sprite_get_width(s_key_wide)-1,
 why+keyrow*4,
 0, c_dkgray, 220, 1,
 write_fansi_width( "A", s_fansi_font, 1.0, -1 )/2,
 mx,my
);

typing = typing and not render_key( // Left ALT
 263, "ALT",
 ecks+sprite_get_width(s_key_wide)+sprite_get_width(s_key)-2,
 why+keyrow*4,
 3, c_dkgray, 202, 1,
 write_fansi_width( "ALT", s_fansi_font, 1.0, -1 )/2,
 mx,my
);


typing = typing and not render_key( // Spacebar
 32, "",
 ecks+sprite_get_width(s_key_wide)*2+sprite_get_width(s_key)-3,
 why+keyrow*4,
 1, c_dkgray, 202, 1, 0,
 mx,my
);

var accumx= ecks+sprite_get_width(s_key_wide)*2+sprite_get_width(s_key)+sprite_get_width(s_spacebar)-4;

typing = typing and not render_key( // Pound Key
 35, chr(35),
 accumx,
 why+keyrow*4,
 0, global.fansi_color[94], 214, 1,
 write_fansi_width( "A", s_fansi_font, 1.0, -1 )/2,
 mx,my
);

typing = typing and not render_key( // @ Key
 ord('@'), "@",
 accumx+sprite_get_width(s_key),
 why+keyrow*4,
 0, global.fansi_color[94], 214, 1,
 write_fansi_width( "A", s_fansi_font, 1.0, -1 )/2,
 mx,my
);

typing = typing and not render_key( // Inverted Smiley Key
 266, chr(1),
 accumx+sprite_get_width(s_key)*2,
 why+keyrow*4,
 0, c_dkgray, 202, 1,
 write_fansi_width( "A", s_fansi_font, 1.0, -1 )/2,
 mx,my
);

typing = typing and not render_key( // Right Shift
 265, chr(30),
 accumx+sprite_get_width(s_key)*3,
 why+keyrow*4,
 0, c_dkgray, 9, 1,
 write_fansi_width( "A", s_fansi_font, 1.0, -1 )/2,
 mx,my
);


// Numpad
