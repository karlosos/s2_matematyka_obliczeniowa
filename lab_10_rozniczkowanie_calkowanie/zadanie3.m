clear all
clc 
close all

F = @(x) cos(4*x) - 0.5*x
FP = @(x) -4*sin(4*x)-0.5
FPP = @(x) -16*cos(4*x)

x = 0:0.01:5;
y = FPP(x);

FW3P = @(x, h) 1/(h*h) * (F(x+h)-2*F(x)+F(x-h));
FW5P = @(x, h) 1/(12*h^2) * (-F(x-2*h) + 16*F(x-h) - 30*F(x) + 16*F(x+h) - F(x+2*h));

subplot(3,2,1)
plot(x, y);
hold on;
plot(x, FW3P(x, 1));
title('FW3P h=1');

subplot(3,2,3)
plot(x, y);
hold on;
plot(x, FW3P(x, 0.5));
title('FW3P h=0.5');

subplot(3,2,5)
plot(x, y);
hold on;
plot(x, FW3P(x, 0.25));
title('FW3P h=0.25');

% FW5P
subplot(3,2,2)
plot(x, y);
hold on;
plot(x, FW5P(x, 1));
title('FW5P h=1');

subplot(3,2,4)
plot(x, y);
hold on;
plot(x, FW5P(x, 0.5));
title('FW5P h=0.5');

subplot(3,2,6)
plot(x, y);
hold on;
plot(x, FW5P(x, 0.25));
title('FW5P h=0.25');


% MSE
% h=0.25 W5P daje mi gorzej ni¿ W3P :(
for i=[1, 0.5, 0.25]
    d = y;
    W3P = FW3P(x, i);
    W5P = FW5P(x, i);
    n = size(x, 2);

    i
    mse_3 = (1/n) * sum((d-W3P).^2)
    mse_5 = (1/n) * sum((d-W5P).^2)
end
