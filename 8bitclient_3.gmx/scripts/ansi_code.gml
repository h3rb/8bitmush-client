var n=argument0;

      //show_message(spliff+splut);
      switch ( global.ansi_values[0] ) {

       case 38: 
        if ( global.ansi_values[1] == 5 ) {
         global.fore_color=real(global.ansi_values[2]);
         //show_message("setting foreground to "+int(values[2]));
         return true;
        }
        break;
                
       case 48:
        if ( global.ansi_values[1] == 5 ) {
         global.back_color=real(global.ansi_values[2]);
         //show_message("setting background to "+int(values[2]));
         return true;
        }
        break;
        
       default:
          // Interpret all modal codes
          {
           var i=0; 
           for ( i=0; i<n; i++ ) ansi_code_single(global.ansi_values[i]);
          }
        break;
      }
