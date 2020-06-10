clc
clear all
h=2^(-8)

%funkcja 1
f1=@(x, y) x.^2 - y.^2 - 1;
a1=0.5;
b1=3;

% funkcja 2
f2=@(x, y) x.^3 - y.^2;
a2=-3;
b2=3;

%pierwsza pochodna
fp1=@(x, y)((f1(x+h, y)-f1(x-h, y))/(2*h));
fp2=@(x, y)((f2(x, y+h)-f2(x, y-h))/(2*h));

[x, y] = meshgrid(1:0.1:3, -3:0.1:3);

figure(1)
subplot(2, 1, 1);
mesh(x, y, f1);
hold on
mesh(x, y, f2);

subplot(2, 1, 2);
[c H] = contour(x, y, f2);
clabel(c, H);
hold on
[c H] = contour(x, y, f2);
clabel(c, H);

% warunki poczatkowe
d = 1; 
x = 1;
y = 0;

J = [ fp1(x, y)/x, fp1(x, y)/y; fp2(x, y)/x, fp2(x, y)/y ];
f = [f1(x, y), f2(x, y)];
d = J\f
