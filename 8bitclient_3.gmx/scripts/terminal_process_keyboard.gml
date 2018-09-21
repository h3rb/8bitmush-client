if ( global.key_pressed[259] and not global.key_waspressed[259] ) {
 global.caps=not global.caps;
 if ( not global.caps ) global.shiftlock=false;
 if ( global.caps ) audio_play_sound(sfx_key_locked,100,0);
}

if ( global.key_pressed[265] or global.key_pressed[260] ) global.shiftlock=false;

if ( global.key_pressed[257] ) {
// if ( not global.shiftlock ) audio_play_sound(sfx_key_locked,100,0);
 global.shiftlock=true;
}

var i;
for ( i=32; i<127; i++ ) {
 if ( global.key_pressed[i] and not global.key_waspressed[i] ) {
  global.terminal.local_input+=chr(i);
 }  
}

if ( global.key_pressed[13] and not global.key_waspressed[13] ) {
 if ( global.terminal.macro_recording and global.terminal.macro_is_selected != -1 ) {
  global.terminal.macro[global.terminal.macro_is_selected]=local_input;
  local_input="";
  global.terminal.macro_recording=false;
  global.terminal.macro_is_selected=-1;
 } else {
  input=local_input;
  prior_input[prior_inputs+1]=local_input;
  prior_inputs++;
  prior_walkback=-1;  
  network_send();
  local_input="";
 }
}

if ( global.key_pressed[256] and not global.key_waspressed[256] ) {
 var len=string_length(global.terminal.local_input);
 global.terminal.local_input=string_delete(global.terminal.local_input,len,1);
}
