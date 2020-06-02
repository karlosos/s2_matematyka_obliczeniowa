clc
clear all
close

figure
bryla
hold on

x1 = 0;
x2 = 385;
x3 = 579;
x4 = 655;

y1 = 0;
y2 = 352;
y3 = 417;
y4 = 439;
y5 = 572;

z1 = 0;
z2 = 191;
z3 = 210;
z4 = 273;


% Trapez zielony
szerokoscTrapezu = x4;
h = z4;
a = y2;
b = y4;
ob1 = (((a+b)/2)*h)*szerokoscTrapezu;
    
    suma = 0;
    for x = x1 : 25 : x4
        for y = y1 : 25 : y2
            suma = suma + z2;
            plot3([x,x], [y,y], [z1,z4],'g');
            plot3([x,x], [y,y], [z1,z4],'r.');

        end
    end

    % Trapez zielony
szerokoscTrapezu = x4;
h = z4;
a = y2;
b = y4;
ob1 = (((a+b)/2)*h)*szerokoscTrapezu;
    
    suma = 0;
    for x = x1 : 25 : x4
        for y = y1 : 25 : y2
            suma = suma + z4;
            plot3([x,x], [y,y], [z1,z4],'g');
            plot3([x,x], [y,y], [z1,z4],'r.');

        end
    end
 
szerokoscTrapezu = x3-x2;
h = z3;
a = y5 - y4;
b = a;
ob2 = (((a+b)/2)*h)*szerokoscTrapezu;
[c, d] = meshgrid([x1,x4], [y2,y4]);
zz = [z4 z4; z2 z2];

    suma2 = 0;
    for x = x1 : 25 : x4
        for y = y2 : 25 : y4
            suma2 = suma2 + z2;
            plot3([x,x], [y,y], [z1,interp2(c, d, zz, x, y)],'g');
            plot3([x,x], [y,y], [z1,interp2(c, d, zz, x, y)],'r.');

        end
    end
    
    % purpurowy
    szerokoscTrapezu = x3-x2;
h = z3 - z2;
a = y5 - y3;
b = y5 - y4;
ob3 = (((a+b)/2) * h) * szerokoscTrapezu;
[c, d] = meshgrid([x2,x3], [y3,y4,y5]);
zz = [z3 z3; z2 z2; z2 z2];
    suma3 = 0;
    for x = x2 : 25 : x3
        for y = y3 : 25 : y5
            suma3 = suma3 + z2;
            plot3([x,x], [y,y], [interp2(c, d, zz, x, y), z3],'g');
            plot3([x,x], [y,y], [interp2(c, d, zz, x, y), z3],'r.');
        end
    end
    
    
    %czerwony
    szerokoscTrapezu = x3-x2;
h = z3 - z2;
a = y5 - y3;
b = y5 - y4;
ob3 = (((a+b)/2) * h) * szerokoscTrapezu;
    suma4 = 0;
    for x = x2 : 25 : x3
        for y = y4 : 25 : y5
            suma4 = suma4 + z2;
            plot3([x,x], [y,y], [z1,z2],'g');
            plot3([x,x], [y,y], [z1,z2],'r.');

        end
    end
    view(3);
    
