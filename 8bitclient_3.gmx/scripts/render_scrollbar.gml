draw_set_blend_mode(bm_add);

if ( not global.terminal.sidebar_is_open ) {
 
 var x1=room_width-64-16-32;
 var y1=64+8;
 var x2=room_width-64-16;
 var y2=room_height*0.8;
 
 draw_set_color(c_dkgray);
 draw_roundrect( x1+8,y1+8,x2-8,y2-8, false );
 
 var scrolled=(global.terminal.scroll+global.terminal.row)/global.terminal.maxrows;

 var scrolledy=scrolled*(y2-y1)+y1;
// draw_set_color(c_gray);
 draw_roundrect( x1+2,scrolledy-32,x2-2,scrolledy+32, false );

} else {

 var x1=room_width-64*5-44;
 var y1=64+8;
 var x2=room_width-64*5;
 var y2=room_height*0.8;
 
 draw_set_color(c_dkgray);
 draw_roundrect( x1+8,y1+8,x2-8,y2-8, false );
 
 var scrolled=(global.terminal.scroll+global.terminal.row)/global.terminal.maxrows;

 var scrolledy=scrolled*(y2-y1)+y1;
// draw_set_color(c_gray);
 draw_roundrect( x1+2,scrolledy-32,x2-2,scrolledy+32, false );

}

draw_set_blend_mode(bm_normal);
