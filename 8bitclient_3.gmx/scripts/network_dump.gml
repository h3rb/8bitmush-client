var sending=argument0;
if ( string_length(global.terminal.input) > 0 ) {
 var temp=global.terminal.input;
 global.terminal.input=sending;
 network_send();
 global.terminal.input=temp;
} else {
 global.terminal.input=sending;
 network_send();
}
