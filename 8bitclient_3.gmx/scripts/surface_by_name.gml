var i;
for ( i=0; i<global.surfaces; i++ ) {
 if ( global.surface_n[i] == argument0 ) return surface_request(i);
}
return noone;
