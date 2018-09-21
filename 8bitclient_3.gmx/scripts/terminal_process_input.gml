var i=0;
var length=global.network.lastread;

if ( global.incomplete_ansi_code ) {
 var ansi=global.incomplete_ansi_code_content;
 var j=0;
 var stop=false;
 var complete=false;
 while ( i < length and not stop and j < 20 )  {
  j++;
  switch ( in[i] ) {
   case 27:
     stop=true;
    break;
   case ord('m'): {
     ansi+='m';
     stop=true;
     complete=true;
    }
    break;
   default: ansi+=chr(in[i]); break;
  }
  i++;
 }
 if ( complete ) {
//  show_message("Code completed: "+ansi);
  // Remove ESC (chr(27)), m and [
  //var spliff=(ansi+" i="+int(i)+" k="+int(k));
  ansi=string_replace_all(ansi,"[","");
  ansi=string_replace_all(ansi,"m","");
  var result=string_split(ansi,";");
  var j;
  //var splut="";
  for ( j=0; j<result; j++ ) {
  global.ansi_values[j]=real(global.split[j]);
  // splut+="#["+int(j)+"]"+int(values[j]);
  }
  ansi_code(result); 
 } else {
  i=0;
  show_message("Could not reconstruct truncated ANSI code: "+ansi);
  global.incomplete_ansi_code=false;
  global.incomplete_ansi_code_content="";
 }
}

var start=i;
var last_encountered_space_on_this_line=-1;

for ( i=start; i<length; i++ ) {
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
   var k=i+1;
   if ( k < length ) 
   {
     global.incomplete_ansi_code=false;
     // Gather code (ends with m, starts with bracket, is generally less than 15, ends on next ESC too
     var ansi="";
     var stop=false;
     var error=false;if ( in[k] == ord('M') or in[k] == ord('m') ) { // this is ansi music
      global.music_in="M";
      while ( not stop ) {
       if ( in[k] == 14 ) {
        stop=true;
        if ( global.show_note_when_music_plays ) i=k-1;
        else i=k;
       } else {
        global.music_in+=chr(in[k]);
       }
      }
      cue_ansi_music();
      global.terminal.code[global.terminal.col,global.terminal.row]+=chr(14)+global.music_in+chr(0);
     } else {
      while ( not stop ) {
       if ( k < length ) {
        if ( in[k] == 27 ) {
         stop=true;
         i=k;
        } else if ( in[k] == 109 ) { // m
         ansi+=chr(in[k]);
         stop=true;
         global.terminal.code[global.terminal.col,global.terminal.row]+=ansi;
         i=k;
        } else {
         ansi+=chr(in[k]);
         k+=1;
        }
       } else {
        stop=true;
        error=true; // code truncated, due to network async?        
        global.incomplete_ansi_code=true;
        global.incomplete_ansi_code_content=ansi;
//        show_message("Truncated code at:"+int(k)+"-"+int(i)+"/"+int(length)+":"+int(global.terminal.col)+","+int(global.terminal.row)+"#"+ansi);
        i=k
        //global.terminal.code[global.terminal.col,global.terminal.row]+="[TRUNCATED]";
       }
      }
      if ( not error ) {
       // Remove ESC (chr(27)), m and [
       //var spliff=(ansi+" i="+int(i)+" k="+int(k));
       ansi=string_replace_all(ansi,"[","");
       ansi=string_replace_all(ansi,"m","");
       var result=string_split(ansi,";");
       var j;
       //var splut="";
       for ( j=0; j<result; j++ ) {
        global.ansi_values[j]=real(global.split[j]);
       // splut+="#["+int(j)+"]"+int(values[j]);
       }
       ansi_code(result);
      }
     }
   }
  }
  break;
  case 32: last_encountered_space_on_this_line=global.terminal.col;
  default: // copy to terminal screen array
//   if ( not (in[i] == 32 and global.terminal.col == 0 and global.back_color == 0 and i<length-1 and in[i+1] != 32 ) ) // 
/*
 When executing precisely:
 
page ,=Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

a single line has a space added because a , appears at exactly character ENDCOL.  The above line trims all leading spaces that are single spaces,
but this does not have the desired effect and impacts framebuffer output too greatly.
*/ 
   {
    global.terminal.fore[global.terminal.col,global.terminal.row]=global.fore_color;
    global.terminal.back[global.terminal.col,global.terminal.row]=global.back_color;
    global.terminal.character[global.terminal.col,global.terminal.row]=in[i];
    global.terminal._slow[global.terminal.col,global.terminal.row]= global.terminal.blink_slow;
    global.terminal._fast[global.terminal.col,global.terminal.row]= global.terminal.blink_fast;
    global.terminal._italic[global.terminal.col,global.terminal.row]= global.terminal.italic;
    global.terminal._strikethru[global.terminal.col,global.terminal.row]= global.terminal.strikethru;
    global.terminal._fraktur[global.terminal.col,global.terminal.row]= global.terminal.fraktur;
    global.terminal._underline[global.terminal.col,global.terminal.row]= global.terminal.underline;
    global.terminal._double[global.terminal.col,global.terminal.row] = global.terminal.double_ul;  
    global.terminal.col++;
    if ( global.terminal.col >= global.terminal.maxwidth ) {
     var advanceRow=true;
     if ( i < length-1 ) {
      var next_char=in[i+1];
      if ( is_alphanumpunct(next_char) ) {
       // Step back to the beginning of the word.
       var m=global.terminal.col-1;
       var n=global.terminal.row;
       while ( m > 0 and is_alphanumpunct(global.terminal.character[m,n]) ) {
        m--;
       }
       if ( global.terminal.character[m,n] == 32 ) { // Copy to next row, replacing with spaces, leave pen at end of wrapping.
        var endcol=global.terminal.col-1;
        global.terminal.row++;
        last_encountered_space_on_this_line=-1;
        if ( global.terminal.scroll < 0 ) global.terminal.scroll--;
        if ( global.terminal.row >= global.terminal.maxrows ) {
         terminal_push_up();
         global.terminal.row=global.terminal.maxrows-1;
        }
        global.terminal.col=0;
        n=global.terminal.row-1;
        var out="";
        while ( m < endcol ) {
         m++;
         if ( not (global.terminal.character[m,n] == 32 and global.terminal.back[m,n] == 0) ) {
          global.terminal.fore[global.terminal.col,global.terminal.row]=global.terminal.fore[m,n];
          global.terminal.back[global.terminal.col,global.terminal.row]=global.terminal.back[m,n];
          global.terminal.character[global.terminal.col,global.terminal.row]=global.terminal.character[m,n];
          global.terminal._slow[global.terminal.col,global.terminal.row]= global.terminal._slow[m,n];
          global.terminal._fast[global.terminal.col,global.terminal.row]= global.terminal._fast[m,n];
          global.terminal._italic[global.terminal.col,global.terminal.row]= global.terminal._italic[m,n];
          global.terminal._strikethru[global.terminal.col,global.terminal.row]= global.terminal._strikethru[m,n];
          global.terminal._fraktur[global.terminal.col,global.terminal.row]= global.terminal._fraktur[m,n];
          global.terminal._underline[global.terminal.col,global.terminal.row]= global.terminal._underline[m,n];
          global.terminal._double[global.terminal.col,global.terminal.row] = global.terminal._double[m,n];  
          global.terminal.col++;
         }
         terminal_reset_char(m,n);
         out+=chr(global.terminal.character[m,n]);
        }
        //show_message("'"+out+"' last:"+int(last_encountered_space_on_this_line));
        advanceRow=false;
       }
      }
     }
     if ( advanceRow ) {
      global.terminal.row++;
      last_encountered_space_on_this_line=-1;
      if ( global.terminal.scroll < 0 ) global.terminal.scroll--;
      if ( global.terminal.row >= global.terminal.maxrows ) {
       terminal_push_up();
       global.terminal.row=global.terminal.maxrows-1;
      } 
      global.terminal.col=0;     
     }
    }    
   }
  break; 
 }
}

// Move back to beginning of next line...
/*
global.terminal.row+=1;
if ( global.terminal.scroll < 0 ) global.terminal.scroll--;
if ( global.terminal.row >= global.terminal.maxrows ) {
 terminal_push_up();
 global.terminal.row=global.terminal.maxrows-1;
}
global.terminal.col=0;
*/
