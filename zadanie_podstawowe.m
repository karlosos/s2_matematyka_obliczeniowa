clc 
clear all
close all

% Zdefiniowanie punktow bryły
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

% Rysowanie bryly
bryla;
hold on

%
% Obliczenie objętości klasycznie
%

% Trapez zielony
szerokoscTrapezu = x4;
h = z4;
a = y2;
b = y4;
ob1 = (((a+b)/2)*h)*szerokoscTrapezu;
line([x4 x4], [y1 y4], [z1 z1], 'LineWidth', 2, 'color', 'g');
line([x4 x4], [y1 y1], [z1 z4], 'LineWidth', 2, 'color', 'g');
line([x4 x4], [y1 y2], [z4 z4], 'LineWidth', 2, 'color', 'g');
line([x4 x4], [y2 y4], [z4 z2], 'LineWidth', 2, 'color', 'g');
line([x4 x4], [y4 y4], [z2 z1], 'LineWidth', 2, 'color', 'g');

% Trapez czerwony
szerokoscTrapezu = x3-x2;
h = z2;
a = y5 - y4;
b = a;
ob2 = (((a+b)/2)*h)*szerokoscTrapezu;
line([x3 x3], [y4 y5], [z1 z1], 'LineWidth', 2, 'color', 'g');
line([x3 x3], [y4 y5], [z2 z2], 'LineWidth', 2, 'color', 'g');
line([x3 x3], [y4 y4], [z1 z2], 'LineWidth', 2, 'color', 'g');
line([x3 x3], [y5 y5], [z1 z2], 'LineWidth', 2, 'color', 'g');

% Trapez purpurowy
szerokoscTrapezu = x3-x2;
h = z3 - z2;
a = y5 - y3;
b = y5 - y4;
ob3 = (((a+b)/2) * h) * szerokoscTrapezu;
line([x3 x3], [y3 y4], [z3 z2], 'LineWidth', 2, 'color', 'g');
line([x3 x3], [y3 y5], [z3 z3], 'LineWidth', 2, 'color', 'g');
line([x3 x3], [y5 y5], [z3 z2], 'LineWidth', 2, 'color', 'g');

% Wynik
Ob = ob1 + ob2 + ob3;
disp(sprintf('Kubatura sali wynosi: %d', Ob))
view(3)

%
% TODO obliczenie metodą prostokątów
%

%
% TODO^
%

%
% Monte Carlo
%

% Rysowanie bryły
figure
bryla
hold on

% Generowanie punktów losowych
ilosc_punktow = 50000;
X = (rand(1, ilosc_punktow))*x4;
Y = (rand(1, ilosc_punktow))*y5;
Z = (rand(1, ilosc_punktow))*z4;

ile_trafionych = 0;
objetosc_przestrzeni = x4 * y5 * z4;

% Określanie czy strzał trafiony
for i = 1:1:ilosc_punktow
    if Z(i) <= z4 && Y(i) <= y2 && X(i) <= x4
        plot3(X(i),Y(i),Z(i), '*g');
        ile_trafionych = ile_trafionych + 1;
    elseif Z(i) <= z3 && Y(i) <= y5 && Y(i) >= y4 && X(i) >= x2 && X(i) <= x3
        plot3(X(i),Y(i),Z(i), '*g');
        ile_trafionych = ile_trafionych + 1;
    elseif Z(i) <= interp2([x4 0], [y2 y4], [z4 z4; z2 z2], X(i), Y(i), 'cubic')
        plot3(X(i),Y(i),Z(i), '*g');
        ile_trafionych = ile_trafionych + 1;
    else
        plot3(X(i),Y(i),Z(i), '*r');
    end
end

view(140, 35)

% Obliczanie objętości
wynik = (ile_trafionych/ilosc_punktow) * objetosc_przestrzeni;
disp(sprintf('Kubatura sali wynosi: %d', wynik));

% Wynik sie rozni od tego analitycznie.
% Błąd jest tutaj czy w analitycznym?