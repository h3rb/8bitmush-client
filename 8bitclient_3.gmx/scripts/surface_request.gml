if ( global.surface_i[argument0]== noone ) {
 global.surface_i[argument0]=surface_create_color_alpha(
  global.surface_w[argument0],
  global.surface_h[argument0],
  global.surface_c[argument0],
  global.surface_a[argument0]
 );
 return global.surface_i[argument0];
} else if ( !surface_exists(global.surface_i[argument0]) ) {
 global.surface_i[argument0]=surface_create_color_alpha(
  global.surface_w[argument0],
  global.surface_h[argument0],
  global.surface_c[argument0],
  global.surface_a[argument0]
 );
 return global.surface_i[argument0];
} else return global.surface_i[argument0];
