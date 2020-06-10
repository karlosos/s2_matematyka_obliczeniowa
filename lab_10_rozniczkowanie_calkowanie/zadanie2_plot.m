close all
subplot(2, 1, 1)
plot(x1, y1)
hold on
plot(x1, yp1)
title("Zestaw 1")
legend('Wzorzec', 'Sposob 2')

subplot(2, 1, 2)
plot(x2, y2)
hold on
plot(x2, yp2)
title("Zestaw 2")
legend('Wzorzec', 'Sposob 2')