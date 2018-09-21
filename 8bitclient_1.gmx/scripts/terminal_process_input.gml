var i;
var length=global.network.lastread;

for ( i=0; i<length; i++ ) {
 switch ( in[i] ) {
  case 10:
   {
    global.terminal.row+=1;
    if ( global.terminal.scroll < 0 ) global.terminal.scroll--;
    if ( global.terminal.row >= global.terminal.maxrows ) {
     terminal_push_up();
     global.terminal.row=global.terminal.maxrows-1;
    }
   }
   break;
  case 13:
    global.terminal.col=0;
   break;
  case 27: // Ansi Code Signal
   {
     // Gather code (ends with m, starts with bracket, is generally less than 15, ends on next ESC too
     var ansi="";
     var k=i+1;
     var stop=false;
     var error=false;
     while ( not stop ) {
      if ( k < length ) {
       if ( in[k] == 27 ) {
        stop=true;
        i=k;
       } else if ( in[k] == 109 ) { // m
        ansi+=chr(in[k]);
        stop=true;
        i=k;
       } else {
        ansi+=chr(in[k]);
        k+=1;
       }
      } else {
       stop=true;
       error=true; // code truncated
       show_message("Truncated code at:"+int(k)+","+int(i));
      }
     }
     if ( not error ) {
      // Remove ESC (chr(27)), m and [
      //var spliff=(ansi+" i="+int(i)+" k="+int(k));
      ansi=string_replace_all(ansi,"[","");
      ansi=string_replace_all(ansi,"m","");
      var result=string_split(ansi,";");
      var j,values;
      //var splut="";
      for ( j=0; j<result; j++ ) {
       values[j]=real(global.split[j]);
      // splut+="#["+int(j)+"]"+int(values[j]);
      }
      //show_message(spliff+splut);
      switch ( values[0] ) {
       case 0: // "Normal Text"
         global.fore_color=global.default_fore_color;
         global.back_color=global.default_back_color;
         //show_message("setting normal text");
        break;
        
        // Foreground
        
       case 30:
       case 31:
       case 32:
       case 33:
       case 34:
       case 35:
       case 36:
       case 37:
         global.fore_color=values[0]-30;
        break;
        
       case 38: 
        if ( values[1] == 5 ) {
         global.fore_color=real(values[2]);
         //show_message("setting foreground to "+int(values[2]));
        }
        break;
        
        // Background       
        
       case 40:
       case 41:
       case 42:
       case 43:
       case 44:
       case 45:
       case 46:
       case 47:
         global.back_color=values[0]-40;
        break;
        
       case 48:
        if ( values[1] == 5 ) {
         global.back_color=real(values[2]);
         //show_message("setting background to "+int(values[2]));
        }
        break;
        default: break; // Other codes...
      }
     } else { // Other codes...
     }
   }
  break;
  default: // copy to terminal screen array
   {
    global.terminal.fore[global.terminal.col,global.terminal.row]=global.fore_color;
    global.terminal.back[global.terminal.col,global.terminal.row]=global.back_color;
    global.terminal.character[global.terminal.col,global.terminal.row]=in[i];
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
  break; 
 }
}

// Move back to beginning of next line...
global.terminal.row+=1;
if ( global.terminal.scroll < 0 ) global.terminal.scroll--;
if ( global.terminal.row >= global.terminal.maxrows ) {
 terminal_push_up();
 global.terminal.row=global.terminal.maxrows-1;
}
global.terminal.col=0;
