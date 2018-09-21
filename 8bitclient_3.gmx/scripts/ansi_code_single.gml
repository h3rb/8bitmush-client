var code=argument0;

switch ( code ) {
 case 0: { // "Normal Text"
   global.fore_color=global.default_fore_color;
   global.back_color=global.default_back_color;
   global.terminal.inverse=false;
   global.terminal.bold=false;
   global.terminal.underline=false;
   global.terminal.blink_slow=false;
   global.terminal.blink_fast=false;
   global.terminal.strikethru=false;
   global.terminal.fraktur=false;
         //show_message("setting normal text");
  }
  break;
        
 case 1: { // Bold / Highlight
    if ( global.fore_color < 16 ) {
     if ( global.fore_color < 8 ) {
      global.fore_color+=8;
      global.terminal.bold=true;
     } else {
     }
    } else {
    }
  }
  break;  
  
 case 2: { // De-bold / Faint
    if ( global.fore_color < 16 ) {
     if ( global.fore_color >= 8 ) {
      global.fore_color-=8;
      global.terminal.bold=false;
     } else {
     }
    } else {
    }
  }
  break;
  
 case 4: { // Underline:Single
   global.terminal.underline=true;
  }
  break;
  
 case 5: { // Blink: Slow
   global.blink_slow=true;
   global.blink_fast=false;
  }
  break;
  
 case 6: { // Blink: Fast
   global.blink_slow=false;
   global.blink_fast=true;
 }
  
 case 7: { // Inverse
   var temp=global.fore_color;
   global.fore_color=global.back_color;
   global.back_color=temp;
   global.terminal.inverse=true;
  }
  break;
  
 case 8: /* Conceal not supported */ break;
  
 case 9: { // Crossed-out
   global.terminal.strikethru=true;
  }
  break;
 
 case 29: { // Not crossed-out
   global.terminal.strikethru=false;
  }
  break;
  
 case 24: { // Underline: Off
   global.terminal.underline=false;
  }
  break;
  
 case 25: { // Blink: Off
   global.blink_slow=false;
   global.blink_fast=false;
 }
        
        // Foreground
        
       case 30: case 31: case 32: case 33: case 34: case 35: case 36: case 37:
         if ( not global.terminal.inverse ) {
          global.fore_color=(code)-30;
          if ( global.terminal.bold ) global.fore_color+=8;
         } else {
          global.back_color=(code)-30;
          if ( global.terminal.bold ) global.back_color+=8;
         }
        break;
        
        // Background       
        
       case 40: case 41: case 42: case 43: case 44: case 45: case 46: case 47:
         if ( global.terminal.inverse ) {
          global.fore_color=(code)-40;
          if ( global.terminal.bold ) global.fore_color+=8;
         } else {
          global.back_color=(code)-40;
//          if ( global.terminal.bold ) global.back_color+=8;  // wth why not
         }
        break;
        
        default: show_message("Unsupported ansi code: "+int(code)); break;
}
