var i,j;

for (j=0; j<global.terminal.maxrows-1; j++ ) {
 for ( i=0; i<global.terminal.maxwidth; i++ ) {
  global.terminal.character[i,j]=global.terminal.character[i,j+1];
  global.terminal.fore[i,j]=global.terminal.fore[i,j+1];
  global.terminal.back[i,j]=global.terminal.back[i,j+1];
  global.terminal.code[i,j]=global.terminal.code[i,j+1];
  global.terminal._slow[i,j]=global.terminal._slow[i,j+1];
  global.terminal._fast[i,j]=global.terminal._fast[i,j+1];
  global.terminal._italic[i,j]=global.terminal._italic[i,j+1];
  global.terminal._strikethru[i,j]=global.terminal._strikethru[i,j+1];
  global.terminal._fraktur[i,j]=global.terminal._fraktur[i,j+1];
  global.terminal._underline[i,j]=global.terminal._underline[i,j+1];
  global.terminal._double[i,j]=global.terminal._double[i,j+1];  
 }
}

for (i=0; i<global.terminal.maxwidth; i++ ) {
 global.terminal.character[i,global.terminal.maxrows-1]=" ";
 global.terminal.fore[i,global.terminal.maxrows-1]=7;
 global.terminal.back[i,global.terminal.maxrows-1]=0;
 global.terminal.code[i,global.terminal.maxrows-1]="";
 global.terminal._slow[i,j]=false;
 global.terminal._fast[i,j]=false;
 global.terminal._italic[i,j]=false;
 global.terminal._strikethru[i,j]=false;
 global.terminal._fraktur[i,j]=false;
 global.terminal._underline[i,j]=false;
 global.terminal._double[i,j]=false;  
}

 
