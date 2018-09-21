var in=argument0;
var i;
var length=string_length(in);

for ( i=0; i<length; i++ ) {
 switch ( ord(string_char_at(in,i)) ) {
  case 27: // Ansi Code Signal
   {
     // Gather code (ends with m, starts with bracket, is generally less than 15, ends on next ESC too
     var ansi="";
     var next_m=i;
     var stop=false;
     var error=false;
     while ( not stop ) {
      if ( next_m < length ) {
       var c=string_char_at(in,next_m);
       ansi+=c;
       if ( c == chr(27) ) {
        stop=true;
        i=next_m;
       } else if ( c == 'm' ) {
        stop=true;
        i= next_m+1;
       } else next_m++;
      } else {
       stop=true;
       error=true; // code truncated
      }
     }
     if ( not error and next_m <15 ) {
      // Remove ESC (chr(27)), m and [
      ansi=string_replace_all(ansi,chr(27)+"[","");
      ansi=string_replace_all(ansi,"m","");
      var result=string_split(ansi,";");
      var j,values;
      for ( j=0; j<result; j++ ) {
       values[j]=real(global.split[j]);
      }
      switch ( values[0] ) {
       case 0: // "Normal Text"
         global.fore_color=global.default_fore_color;
         global.back_color=global.default_back_color;
        break;
       case 38: // Foreground
        if ( values[1] == 5 ) {
         global.fore_color=real(values[2]);
        }
        break;
       case 48: // Background
        if ( values[1] == 5 ) {
         global.back_color=real(values[2]);
        }
        break;
        default: break; // Other codes...
      }
     } else { // Other codes...
     }
   }
  break;
  default:
   {
    // copy to terminal screen array
   }
  break;
 }
}
