//---Returns the direction between x1,y1 and x2,y2---//
if (argument0 == 1)
{
    var x1,x2,y1,y2,turn;
    
    x1 = argument1;
    y1 = argument2;
    x2 = argument3;
    y2 = argument4;
    
    turn = arctan2(y2 - y1,x2 - x1) * 180 / pi;
    turn = turn mod 360;
    if (turn < 0)
        turn = turn + 360;
    return(360 - turn);
}
//---Returns the 4 Way Direction from a Degree variable---//
if (argument0 == 2)
{
    var cr,d;
    cr = round(argument1 / 90);
    if (cr == 0 || cr == 4)
        d = 4; //This is RIGHT
    else if (cr == 1)
        d = 3; //This is UP
    else if (cr == 2)
        d = 2; //This is LEFT
    else
        d = 1; //This is DOWN
        
    return (d);
}
//---Returns a length based on the rotation (X)---//
if (argument0 == 3)
{    
    return (cos(argument1 * (pi / 180)) * argument2);
}
//---Returns a length based on the rotation (Y)---//
if (argument0 == 4)
{    
    return (-sin(argument1 * (pi / 180)) * argument2);
}
//---Returns the 8 Way Direction from a Degree variable---//
if (argument0 == 5)
{
    var cr,d;
    cr = round(argument1 / 45);
    d = 1;
    if (cr == 0 || cr == 8)
        d = 8;
    else
        d = cr;
        
    return (d);
    //This goes in the ANTI-CLOCKWISE direction
    //RIGHT (8), UP-RIGHT (1), UP (2), UP-LEFT (3), LEFT (4), LEFT-DOWN (5), DOWN (6), RIGHT-DOWN (7)
}
