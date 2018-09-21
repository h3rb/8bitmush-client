if ( string_length(global.terminal.input) > 0 ) {
 global.terminal.input+=chr(10)+chr(13);
 var output_length = string_length( global.terminal.input );
 var i,c;
 var outgoing = buffer_create( 256, buffer_fast, 1 );
 buffer_seek( outgoing, buffer_seek_start, 0 );
 for ( i=0; i<output_length; i++ ) {
  c = string_char_at(global.terminal.input,i+1);
//  show_message(c);
  buffer_write( outgoing, buffer_u8, ord(c) );
 }
 network_send_raw(
  global.network.socket, outgoing,
  buffer_get_size(outgoing)
 );
 buffer_delete(outgoing);
 if ( global.terminal.local_echo ) {
  // write out to screen
  for ( i=0; i<output_length; i++ ) {
   c= string_char_at(global.terminal.input,i+1);
   if ( c == chr(13) ) {} else
   if ( c == chr(10) ) {
    global.terminal.row++;
    if ( global.terminal.scroll < 0 ) global.terminal.scroll--;
    if ( global.terminal.row >= global.terminal.maxrows ) {
     terminal_push_up();
     global.terminal.row=global.terminal.maxrows-1;
    }
    global.terminal.col=0;
   } else {
    global.terminal.fore[global.terminal.col,global.terminal.row]=3;
    global.terminal.back[global.terminal.col,global.terminal.row]=0;
    global.terminal.character[global.terminal.col,global.terminal.row]=ord(c);
    global.terminal.col++;
    if ( global.terminal.col >= global.terminal.maxwidth ) {
     global.terminal.row++;
     if ( global.terminal.scroll < 0 ) global.terminal.scroll--;
     if ( global.terminal.row >= global.terminal.maxrows ) {
      terminal_push_up();
      global.terminal.row=global.terminal.maxrows-1;
     }
     global.terminal.col=0;
    }
   }
  }  
 }
 input="";
 keyboard_string="";
}
