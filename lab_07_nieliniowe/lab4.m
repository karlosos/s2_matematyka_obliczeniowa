clc
close all
clear all
h = 1/64;

f_1 = @(X) X(1) .^ 2 - X(2) .^2 - 1;
f_2 = @(X) X(1) .^ 3 .* X(2) .^2 - 1;

% f_1 = @(X) 90 .* X(1) .^ 2 + 25 * X(2) .^2 - 225;
% f_2 = @(X) 9 .* X(1) .^ 4 + 25 * X(2) .^3 - 50;

[x, y] = meshgrid(1:0.1:3, -3:0.1:3);
z_1 = x .^ 2 - y .^ 2 - 1;
z_2 = x .^ 3 .* y .^ 2 - 1;
% 
% [x, y] = meshgrid(-6:0.1:6, -6:0.1:6);
% z_1 = 90 .* x .^ 2 + 25 * y .^2 - 225;
% z_2 = 9 .* x .^ 4 + 25 * y .^3 - 50;


figure(1)
mesh(x, y, z_1);
hold on 
mesh(x, y, z_2);

figure(2)
[c H] = contour(x, y, z_1);
clabel(c, H);
hold on
contour(x, y, z_1, [0 0], 'color', 'r', 'LineWidth', 2);

[c H] = contour(x, y, z_2);
clabel(c, H);
contour(x, y, z_2, [0 0], 'color', 'r', 'LineWidth', 2);

%
% obliczanie
% 

% Newton
diff_x = @(f, X) (f([X(1) + h; X(2)]) - f([X(1) - h; X(2)])) * 0.5 / h;
diff_y = @(f, X) (f([X(1); X(2) + h]) - f([X(1); X(2) - h])) * 0.5 / h;

x_k = [3; 0];

J = [diff_x(f_1, x_k) diff_y(f_1, x_k); diff_x(f_2, x_k) diff_y(f_2, x_k)];
d_k = J \ [f_1(x_k); f_2(x_k)];
while norm(d_k) > h
    x_k = x_k - d_k;
    J = [diff_x(f_1, x_k) diff_y(f_1, x_k); diff_x(f_2, x_k) diff_y(f_2, x_k)];
    d_k = J \ [f_1(x_k); f_2(x_k)];
    if all(isnan(d_k))
        fprintf(1, 'Macierz osobliwa\n');
        break
    end
end
x_k = x_k - d_k
plot(x_k(1), x_k(2), 'g*')