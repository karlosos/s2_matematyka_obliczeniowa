clc
clear all
close

figure
bryla
hold on

x1 = 0;
x2 = 400;
x3 = 600;
x4 = 650;

y1 = 0;
y2 = 350;
y3 = 400;
y4 = 450;
y5 = 600;

z1 = 0;
z2 = 200;
z3 = 220;
z4 = 250;

% objetosc
suma = 0;

% Trapez zielony
for x = x1 : 25 : x4 - 25
    for y = y1 : 25 : y2 - 25
        suma = suma + z4;
        plot3([x,x], [y,y], [z1,z4],'g');
        plot3([x,x], [y,y], [z1,z4],'r.');
    end
end
 

[c, d] = meshgrid([x1,x4], [y2,y4]);
zz = [z4 z4; z2 z2];

for x = x1 : 25 : x4 - 25
    for y = y2 : 25 : y4 - 25
        suma = suma + interp2(c, d, zz, x, y);
        plot3([x,x], [y,y], [z1,interp2(c, d, zz, x, y)],'g');
        plot3([x,x], [y,y], [z1,interp2(c, d, zz, x, y)],'r.');
    end
end
    
% purpurowy
[c, d] = meshgrid([x2,x3], [y3,y4,y5]);
zz = [z3 z3; z2 z2; z2 z2];
for x = x2 : 25 : x3 - 25
    for y = y3 : 25 : y5 - 25
        suma = suma + (z3 - interp2(c, d, zz, x, y));
        plot3([x,x], [y,y], [interp2(c, d, zz, x, y), z3],'g');
        plot3([x,x], [y,y], [interp2(c, d, zz, x, y), z3],'r.');
    end
end
    
    
%czerwony
for x = x2 : 25 : x3 - 25
    for y = y4 : 25 : y5 - 25
        suma = suma + z2;
        plot3([x,x], [y,y], [z1,z2],'g');
        plot3([x,x], [y,y], [z1,z2],'r.');
    end
end

suma * (25^2)
view(140, 35);
    