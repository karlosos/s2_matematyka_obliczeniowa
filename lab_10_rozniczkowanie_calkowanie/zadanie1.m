clear all
clc 

F = @(x) cos(2*x);
FP = @(x) (-2*sin(2*x));

x = 0:0.01:6;
y = FP(x);

% W2P
FW2P = @(x, h) ((F(x+h) - F(x))/(h));

subplot(3,3,1)
plot(x, y);
hold on;
plot(x, FW2P(x, 1));
title('FW2P h=1');

subplot(3,3,2)
plot(x,y);
hold on;
plot(x, FW2P(x, 0.5));
title('FW2P h=0.5');

subplot(3,3,3)
plot(x,y);
hold on;
plot(x, FW2P(x, 0.25));
title('FW2P h=0.25');

% W3P

FW3P = @(x, h) ((F(x+h) - F(x-h))/(2*h));

subplot(3,3,4)
plot(x,y);
hold on;
plot(x, FW3P(x, 1));
title('FW3P h=1');

subplot(3,3,5)
plot(x,y);
hold on;
plot(x, FW3P(x, 0.5));
title('FW3P h=0.5');

subplot(3,3,6)
plot(x,y);
hold on;
plot(x, FW3P(x, 0.25));
title('FW3P h=0.25');

% W5P

FW5P = @(x, h) (1/(12*h) * (F(x-2*h)-8*F(x-h) + 8*F(x+h) - F(x+2*h)));

subplot(3,3,7)
plot(x,y);
hold on;
plot(x, FW5P(x, 1));
title('FW5P h=1');

subplot(3,3,8)
plot(x,y);
hold on;
plot(x, FW5P(x, 0.5));
title('FW5P h=0.5');

subplot(3,3,9)
plot(x,y);
hold on;
plot(x, FW5P(x, 0.25));
title('FW5P h=0.25');

%
% MSE
%

% W2P
for i=[1, 0.5, 0.25]
    d = y;
    p2 = FW2P(x, i);
    p3 = FW3P(x, i);
    p5 = FW5P(x, i);
    n = size(x, 2);

    i
    mse_2 = (1/n) * sum((d-p2).^2)
    mse_3 = (1/n) * sum((d-p3).^2)
    mse_5 = (1/n) * sum((d-p5).^2)
end
