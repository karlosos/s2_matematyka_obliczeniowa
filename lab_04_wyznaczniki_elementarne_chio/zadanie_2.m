clear all
clc

times = [];
x = 1:10:2000;
for i=x
    matrix = rand(i, i);
    tic
    det(matrix);
    times = [times toc];
end

plot(x, times, '.')
hold on;
p = polyfit(x, times, 3);

x1 = 1:1:2000;
y1 = polyval(p, x1);
plot(x1, y1);
