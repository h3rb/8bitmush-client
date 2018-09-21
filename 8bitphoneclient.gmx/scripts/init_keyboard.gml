global.double_sized_keyboard=false;//true;
global.keyboard_scale=1;//2;
global.precise_keyboard=true;

global.key_repeat_delay=room_speed/3;
global.key_repeat_interval=room_speed/5;

global.caps=false;
global.shiftlock=false;

if ( not global.double_sized_keyboard ) {
// Style hitbox information, label center (line bottom), key's sprite, not doubled

// 0 (Standard Key)

if ( global.precise_keyboard ) {
 global.khbx1[0]=6;
 global.khby1[0]=0;
 global.khbx2[0]=sprite_get_width(s_key)-6;
 global.khby2[0]=sprite_get_height(s_key)-10;
} else {
 global.khbx1[0]=0;
 global.khby1[0]=0;
 global.khbx2[0]=sprite_get_width(s_key);
 global.khby2[0]=sprite_get_height(s_key);
}
global.klcx[0]=17;
global.klcy[0]=4;
global.keysprite[0]=s_key;
global.keysound[0]=sfx_key;

// 1 (Spacebar)

if ( global.precise_keyboard ) {
 global.khbx1[1]=6;
 global.khby1[1]=0;
 global.khbx2[1]=sprite_get_width(s_spacebar)-6;
 global.khby2[1]=sprite_get_height(s_spacebar)-10;
} else {
 global.khbx1[1]=0;
 global.khby1[1]=0;
 global.khbx2[1]=sprite_get_width(s_spacebar);
 global.khby2[1]=sprite_get_height(s_spacebar);
}
global.klcx[1]=0; // not applicable
global.klcy[1]=0;
global.keysprite[1]=s_spacebar;
global.keysound[1]=sfx_spacebar;
 
// 2 (Return Key)

if ( global.precise_keyboard ) {
 global.khbx1[2]=8+8;
 global.khby1[2]=0;
 global.khbx2[2]=sprite_get_width(s_enter_key)-6;
 global.khby2[2]=sprite_get_height(s_enter_key)-10;
} else {
 global.khbx1[2]=8;
 global.khby1[2]=0;
 global.khbx2[2]=sprite_get_width(s_enter_key);
 global.khby2[2]=sprite_get_height(s_enter_key);
}
global.klcx[2]=32;
global.klcy[2]=4;
global.keysprite[2]=s_enter_key;
global.keysound[2]=sfx_enter_key;

// 3 (Wide Key)

if ( global.precise_keyboard ) {
 global.khbx1[3]=6;
 global.khby1[3]=0;
 global.khbx2[3]=sprite_get_width(s_key_wide)-6;
 global.khby2[3]=sprite_get_height(s_key_wide)-10;
} else {
 global.khbx1[3]=0;
 global.khby1[3]=0;
 global.khbx2[3]=sprite_get_width(s_key_wide);
 global.khby2[3]=sprite_get_height(s_key_wide);
}
global.klcx[3]=25;
global.klcy[3]=4;
global.keysprite[3]=s_key_wide;
global.keysound[3]=sfx_backspace;

// 4 (Wider Key)

if ( global.precise_keyboard ) {
 global.khbx1[4]=6;
 global.khby1[4]=0;
 global.khbx2[4]=sprite_get_width(s_key_wider)-6;
 global.khby2[4]=sprite_get_height(s_key_wider)-10;
} else {
 global.khbx1[4]=0;
 global.khby1[4]=0;
 global.khbx2[4]=sprite_get_width(s_key_wider);
 global.khby2[4]=sprite_get_height(s_key_wider);
}
global.klcx[4]=28;
global.klcy[4]=4;
global.keysprite[4]=s_key_wider;
global.keysound[4]=sfx_shift;

// 5 (Widest Key)
if ( global.precise_keyboard ) {
 global.khbx1[5]=6;
 global.khby1[5]=0;
 global.khbx2[5]=sprite_get_width(s_key_widest)-6;
 global.khby2[5]=sprite_get_height(s_key_widest)-10;
} else {
 global.khbx1[5]=0;
 global.khby1[5]=0;
 global.khbx2[5]=sprite_get_width(s_key_widest);
 global.khby2[5]=sprite_get_height(s_key_widest);
}
global.klcx[5]=35;
global.klcy[5]=4;
global.keysprite[5]=s_key_widest;
global.keysound[5]=sfx_alt;

} else {
// 2X (double keyboard) 


// 0 (Standard Key)

if ( global.precise_keyboard ) {
 global.khbx1[0]=6*global.keyboard_scale;
 global.khby1[0]=0;
 global.khbx2[0]=sprite_get_width(s_key_2x)-6*global.keyboard_scale;
 global.khby2[0]=sprite_get_height(s_key_2x)-10*global.keyboard_scale;
} else {
 global.khbx1[0]=0;
 global.khby1[0]=0;
 global.khbx2[0]=sprite_get_width(s_key_2x);
 global.khby2[0]=sprite_get_height(s_key_2x);
}
global.klcx[0]=17*global.keyboard_scale;
global.klcy[0]=4*global.keyboard_scale;
global.keysprite[0]=s_key_2x;
global.keysound[0]=sfx_key;

// 1 (Spacebar)

if ( global.precise_keyboard ) {
 global.khbx1[1]=6*global.keyboard_scale;
 global.khby1[1]=0;
 global.khbx2[1]=sprite_get_width(s_spacebar_2x)-6*global.keyboard_scale;
 global.khby2[1]=sprite_get_height(s_spacebar_2x)-10*global.keyboard_scale;
} else {
 global.khbx1[1]=0;
 global.khby1[1]=0;
 global.khbx2[1]=sprite_get_width(s_spacebar_2x);
 global.khby2[1]=sprite_get_height(s_spacebar_2x);
}
global.klcx[1]=0; // not applicable
global.klcy[1]=0;
global.keysprite[1]=s_spacebar_2x;
global.keysound[1]=sfx_spacebar;
 
// 2 (Return Key)

if ( global.precise_keyboard ) {
 global.khbx1[2]=(8+8)*global.keyboard_scale;
 global.khby1[2]=0;
 global.khbx2[2]=sprite_get_width(s_enter_key_2x)-6*global.keyboard_scale;
 global.khby2[2]=sprite_get_height(s_enter_key_2x)-10*global.keyboard_scale;
} else {
 global.khbx1[2]=8*global.keyboard_scale;
 global.khby1[2]=0;
 global.khbx2[2]=sprite_get_width(s_enter_key_2x);
 global.khby2[2]=sprite_get_height(s_enter_key_2x);
}
global.klcx[2]=32;
global.klcy[2]=4;
global.keysprite[2]=s_enter_key_2x;
global.keysound[2]=sfx_enter_key;

// 3 (Wide Key)

if ( global.precise_keyboard ) {
 global.khbx1[3]=6*global.keyboard_scale;
 global.khby1[3]=0;
 global.khbx2[3]=sprite_get_width(s_key_wide_2x)-6*global.keyboard_scale;
 global.khby2[3]=sprite_get_height(s_key_wide_2x)-10*global.keyboard_scale;
} else {
 global.khbx1[3]=0;
 global.khby1[3]=0;
 global.khbx2[3]=sprite_get_width(s_key_wide_2x);
 global.khby2[3]=sprite_get_height(s_key_wide_2x);
}
global.klcx[3]=25*global.keyboard_scale;
global.klcy[3]=4*global.keyboard_scale;
global.keysprite[3]=s_key_wide_2x;
global.keysound[3]=sfx_backspace;

// 4 (Wider Key)

if ( global.precise_keyboard ) {
 global.khbx1[4]=6*global.keyboard_scale;
 global.khby1[4]=0;
 global.khbx2[4]=sprite_get_width(s_key_wider_2x)-6*global.keyboard_scale;
 global.khby2[4]=sprite_get_height(s_key_wider_2x)-10*global.keyboard_scale;
} else {
 global.khbx1[4]=0;
 global.khby1[4]=0;
 global.khbx2[4]=sprite_get_width(s_key_wider_2x);
 global.khby2[4]=sprite_get_height(s_key_wider_2x);
}
global.klcx[4]=28*global.keyboard_scale;
global.klcy[4]=4*global.keyboard_scale;
global.keysprite[4]=s_key_wider_2x;
global.keysound[4]=sfx_shift;

// 5 (Widest Key)
if ( global.precise_keyboard ) {
 global.khbx1[5]=6*global.keyboard_scale;
 global.khby1[5]=0;
 global.khbx2[5]=sprite_get_width(s_key_widest_2x)-6*global.keyboard_scale;
 global.khby2[5]=sprite_get_height(s_key_widest_2x)-10*global.keyboard_scale;
} else {
 global.khbx1[5]=0;
 global.khby1[5]=0;
 global.khbx2[5]=sprite_get_width(s_key_widest_2x);
 global.khby2[5]=sprite_get_height(s_key_widest_2x);
}
global.klcx[5]=35*global.keyboard_scale;
global.klcy[5]=4*global.keyboard_scale;
global.keysprite[5]=s_key_widest_2x;
global.keysound[5]=sfx_alt;

}


// Establish a huge set of key ids

var i;
for ( i=0; i<1024; i++ ) {
 global.key_pressed[i]=false;
 global.key_waspressed[i]=false;
}

// Establish precomputed labelhofs values
