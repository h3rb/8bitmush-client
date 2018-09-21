if ( string_length(global.terminal.input) > 0 ) {
 global.terminal.input+=chr(10)+chr(13);
 output_length=string_length(global.terminal.input);
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
 global.output_queue+=global.terminal.input;
 global.terminal.input="";
 keyboard_string="";
}
