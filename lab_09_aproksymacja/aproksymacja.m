close all
krok_x = 0.01;
krok_y = 0.001;
x = [0, 0.5, 1, 1.5, 2, 2.5, 3];
y = [0.04, 0.075, 0.11, 0.145, 0.180, 0.215, 0.250];
z = [ 0 0.78 0.74 0 0 0 0;
      0 0.69 0.85 0.72 0.38 0 0;
      0 0.52 0.81 0.81 0.69 0.45 0.15;
      0 0.4 0.76 0.85 0.8 0.68 0.5;
      0 0.34 0.65 0.82 0.84 0.78 0.66;
      0 0.29 0.55 0.80 0.85 0.82 0.75;
      0 0.26 0.48 0.71 0.85 0.84 0.8;
    ];

%
% Model 1 c1x + c2y + c3
%
[X,Y] = meshgrid(x,y);
xp = reshape(X,1,[]);
yp = reshape(Y,1,[]);
zp = reshape(z,1,[]);
d = length(xp);
Z = [xp;yp;ones(1,d)];
C = zp*Z'*inv(Z*Z');
F = @(a, b) (C(1)*a + C(2)*b + C(3));

subplot(2,2,1)
plot3(X,Y,z,'.b');
title('Model nr 1')
hold on
hold on
xx=x(1):krok_x:x(end);
yy=y(1):krok_y:y(end);
[XX,YY]=meshgrid(xx,yy);
W = F(XX,YY);
mesh(XX,YY,W)


%
% Model 2 c1x^2 + c2y^2 + c3
%
[X,Y] = meshgrid(x,y);
xp = reshape(X,1,[]);
yp = reshape(Y,1,[]);
zp = reshape(z,1,[]);
d = length(xp);
Z = [xp.^2;yp.^2;ones(1,d)];
C = zp*Z'*inv(Z*Z');
F = @(a, b) (C(1)*a.^2 + C(2)*b.^2 + C(3));

subplot(2,2,2)
plot3(X,Y,z,'.b');
title('Model nr 2')
hold on
xx=x(1):krok_x:x(end);
yy=y(1):krok_y:y(end);
[XX,YY]=meshgrid(xx,yy);
W = F(XX,YY);
mesh(XX,YY,W)

%
% Model 3 c1x^2 + c2y^2 + c3
%
[X,Y] = meshgrid(x,y);
xp = reshape(X,1,[]);
yp = reshape(Y,1,[]);
zp = reshape(z,1,[]);
d = length(xp);
Z = [xp.^2;yp.^2;xp.*yp;ones(1,d)];
C = zp*Z'*inv(Z*Z');
F = @(a, b) (C(1)*a.^2 + C(2)*b.^2 + C(3)*a.*b + C(4));

subplot(2,2,3)
plot3(X,Y,z,'.b');
title('Model nr 3')
hold on
xx=x(1):krok_x:x(end);
yy=y(1):krok_y:y(end);
[XX,YY]=meshgrid(xx,yy);
W = F(XX,YY);
mesh(XX,YY,W)

%
% Model 4 c1x^2 + c2y^2 + c3
%
[X,Y] = meshgrid(x,y);
xp = reshape(X,1,[]);
yp = reshape(Y,1,[]);
zp = reshape(z,1,[]);
d = length(xp);
Z = [xp.^3;xp.^2;xp;yp.^3;yp.^2;yp;ones(1,d)];
C = zp*Z'*inv(Z*Z');
F = @(a, b) (C(1)*a.^3 + C(2)*a.^2 + C(3)*a + C(4)*b.^3 + C(5)*b.^2 + C(6)*b + C(7));

subplot(2,2,4)
plot3(X,Y,z,'.b');
title('Model nr 4')
hold on
xx=x(1):krok_x:x(end);
yy=y(1):krok_y:y(end);
[XX,YY]=meshgrid(xx,yy);
W = F(XX,YY);
mesh(XX,YY,W)


