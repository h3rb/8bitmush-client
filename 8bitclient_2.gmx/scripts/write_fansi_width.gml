var text=argument0;
var font=argument1;
var scale=argument2;
var wrap_limit=argument3;

var fw=sprite_get_width(font)*scale;
var fh=sprite_get_height(font)*scale;
var i,dx=0,dy=0;
var gdx=0;
var len=string_length(text);
for ( i=0; i<len; i++ ) {
 var c=string_char_at(text,i+1);
 dx+=fw;
 if ( c == chr(13) ) {
  if ( gdx < dx ) gdx=dx;
  dx=0;
  dy+=fh;
 } else if ( wrap_limit > fw
  and dx > wrap_limit ) {
  if ( gdx < dx ) gdx=dx;
  dx=0;
  dy+=fh;
 } else if ( gdx < dx ) gdx=dx;
}

global.write_fansi_height=dy;

return gdx;
