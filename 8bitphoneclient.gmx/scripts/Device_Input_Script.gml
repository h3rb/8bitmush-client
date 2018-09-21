
var arg0,arg1,arg2,arg3;
arg0 = argument0;
arg1 = argument1;
arg2 = argument2;
arg3 = argument3;
arg4 = argument4;

//---Returning whether the cursor is within the radius---//
if (arg0 == 1)
{
    var mx,my;
    mx = device_mouse_x(arg1);
    my = device_mouse_y(arg1);

    return (point_distance(arg2,arg3,mx,my) < arg3 + 0.1);
}
//---Checking if the Mouse Button has been pressed and the cursor is within the radius---//
if (arg0 == 2)
{
    var mx,my;
    mx = device_mouse_x(arg1);
    my = device_mouse_y(arg1);

    return (point_distance(arg2,arg3,mx,my) < arg4 + 0.1 && device_mouse_check_button_pressed(arg1,mb_left));
}
//---Checking if the Mouse Button has been pressed---//   
if (arg0 == 3)
{
    return (device_mouse_check_button_pressed(arg1,mb_left));
}
//---Return a restrictive co-ordinate---//
if (arg0 div 2 == 2)
{
    var r,rx,ry,mx,my;
    mx = device_mouse_x(arg1);
    my = device_mouse_y(arg1);
    r = Angle_Script(1,arg2,arg3,mx,my);
    rx = Angle_Script(3,r,arg4,0,0);
    ry = Angle_Script(4,r,arg4,0,0);
    
    if (point_distance(arg2,arg3,mx,my) > arg4)
    {
        mx = arg2 + rx;
        my = arg3 + ry;
    }        
    if (arg0 == 4)
        return (mx);
    if (arg0 == 5)
        return (my);
}    
//---Checking if the Mouse Button is held down---//   
if (arg0 == 6)
{
    return (device_mouse_check_button(arg1,mb_left));
}
//---Checking if the Mouse Button has been released---//   
if (arg0 == 7)
{
    return (device_mouse_check_button_released(arg1,mb_left));
}

