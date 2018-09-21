var text=argument0;
var font=argument1;
var scale=argument2;
var ecks=argument3;
var why=argument4;
var fore=argument5;
var back=argument6;
var rot=argument7;
var alpha=argument8;
var wrap_limit=argument9;

var fw=sprite_get_width(font)*scale;
var fh=sprite_get_height(font)*scale;
var i,dx=0,dy=0;
var len=string_length(text);
for ( i=0; i<len; i++ ) {
 var x1=ecks+dx;
 var y1=why+dy;
 var x2=x1+fw;
 var y2=y1+fh;
 var c=string_char_at(text,i+1);
 if ( back >= 0 ) {
  draw_set_color(global.fansi_color[back]);
  draw_rectangle(x1,y1,x2,y2,false);
 }
 if ( c == chr(13) ) {
  dx=0;
  dy+=fh;
 } else {
  draw_sprite_ext(
   font,ord(c),x1,y1,scale,scale,
   rot,global.fansi_color[fore],alpha
  );
  dx+=fw;
  if ( wrap_limit > fw
   and dx > wrap_limit ) {
   dx=0;
   dy+=fh;
  }
 }
}

