var sprite=argument0;
var sub=argument1;
var x1=argument2;
var y1=argument3;
var x2=argument4;
var y2=argument5;
var rot=argument6;
var c=argument7;
var a=argument8;

var sprite_w=sprite_get_width(sprite);
var sprite_h=sprite_get_height(sprite);

midpoint(x1,y1,x2,y2);

var h=point_distance(x1,0,global.script_midpoint_x,0);
var v=point_distance(0,y1,0,global.script_midpoint_y);

var scale_x=h/(sprite_w/2);
var scale_y=v/(sprite_h/2);
 
draw_sprite_ext(
 sprite, sub,
 global.script_midpoint_x, global.script_midpoint_y,
 scale_x, scale_y,
 rot,
 c, a
);
