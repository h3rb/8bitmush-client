
if ( not global.terminal.sidebar_is_open ) {

 var x1=window_get_width()-64-16-88;
 var y1=64+8;
 var x2=window_get_width()-64-16;
 var y2=window_get_height()*0.8;
 
 draw_set_color(c_dkgray);
 draw_roundrect( x1+8,y1+8,x2-8,y2-8, false );
 
 var scrolled=(global.terminal.scroll+global.terminal.row)/global.terminal.maxrows;

 var scrolledy=scrolled*(y2-y1)+y1;
 draw_sprite_ext(s_tv,0,x1,scrolledy,1,1,0,c_white,1); 

} else {

 var x1=window_get_width()-64*5-88;
 var y1=64+8;
 var x2=window_get_width()-64*5;
 var y2=window_get_height()*0.8;
 
 draw_set_color(c_dkgray);
 draw_roundrect( x1+8,y1+8,x2-8,y2-8, false );
 
 var scrolled=(global.terminal.scroll+global.terminal.row)/global.terminal.maxrows;

 var scrolledy=scrolled*(y2-y1)+y1;
 draw_sprite_ext(s_tv,0,x1,scrolledy,1,1,0,c_white,1); 

}
