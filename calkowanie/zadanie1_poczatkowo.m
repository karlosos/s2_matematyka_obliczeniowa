clc 
clear all
close all
% rysowanie sali
% todo rysowanie
bryla;
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

y1 = 0;
y2 = 191;
y3 = 210;
y4 = 273;

% Trapez 1
szerokoscTrapezu = 655;
h = 273;
a = 352;
b = 439;
ob1 = (((a+b)/2)*h)*szerokoscTrapezu;
line([655 655], [0 439], [0 0], 'LineWidth', 2, 'color', 'g');
line([655 655], [0 0], [0 273], 'LineWidth', 2, 'color', 'g');
line([655 655], [0 352], [273 273], 'LineWidth', 2, 'color', 'g');
line([655 655], [352 439], [273 191], 'LineWidth', 2, 'color', 'g');
line([655 655], [439 439], [191 0], 'LineWidth', 2, 'color', 'g');

% Trapez 2
szerokoscTrapezu = 579-385;
h = 191;
a = 572 - 439;
b = a;
ob2 = (((a+b)/2)*h)*szerokoscTrapezu;
line([579 579], [439 572], [0 0], 'LineWidth', 2, 'color', 'r');
line([579 579], [439 572], [191 191], 'LineWidth', 2, 'color', 'r');
line([579 579], [439 439], [0 191], 'LineWidth', 2, 'color', 'r');
line([579 579], [572 572], [0 191], 'LineWidth', 2, 'color', 'r');

% Trapez 3
szerokoscTrapezu = 579-385;
h = 210 - 191;
a = 572 - 417;
b = 572 - 439;
ob3 = (((a+b)/2) * h) * szerokoscTrapezu;
line([579 579], [417 439], [210 191], 'LineWidth', 2, 'color', 'm');
line([579 579], [417 572], [210 210], 'LineWidth', 2, 'color', 'm');
line([579 579], [572 572], [210 191], 'LineWidth', 2, 'color', 'm');

% objetosc
Ob = (ob1 + ob2 + ob3);
disp(sprintf('Kubatura sali wynosi: %d', Ob))
view(3)