var i,j;

for (j=0; j<global.terminal.maxrows-1; j++ ) {
 for ( i=0; i<global.terminal.maxwidth; i++ ) {
  global.terminal.character[i,j]=global.terminal.character[i,j+1];
  global.terminal.fore[i,j]=global.terminal.fore[i,j+1];
  global.terminal.back[i,j]=global.terminal.back[i,j+1];
 }
}

for (i=0; i<global.terminal.maxwidth; i++ ) {
 global.terminal.character[i,global.terminal.maxrows-1]=" ";
 global.terminal.fore[i,global.terminal.maxrows-1]=7;
 global.terminal.back[i,global.terminal.maxrows-1]=0;
}

 
