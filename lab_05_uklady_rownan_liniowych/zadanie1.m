clear all
format long e

epsilon = 0.0001;

A = [1 2; 1 2+epsilon];
b = [4; 4+epsilon];

% cramer
W=det(A);
A1 = A;
A1(:, 1) = b;
A2 = A;
A2(:, 2) = b;
x1 = det(A1)/W
x2 = det(A2)/W
x_cramera = [x1; x2]

% odwracanie
x_odwracanie=inv(A)*b

% eliminacja Gaussa
x_gauss = A\b

% rozklad LU
[L, U] = lu(A)

x_LU_1 = inv(U) * inv(L) * b

y = inv(L) * b;
x_LU_2 = inv(U) * y

% rozklad QR
[Q, R] = qr(A);

x_QR_1 = inv(R) * Q' * b

y = Q' * b;
x_QR_2 = inv(R) * y

% SVD
[U,S,V] = svd(A,0);
x_SVD = V*((U'*b)./diag(S))

%
% B³êdy bezwzglêdne
%
analitycznie = [2; 1];
cramer_blad = abs(x_cramera - analitycznie)

odwracanie_blad = abs(x_odwracanie - analitycznie)

gauss_blad = abs(x_gauss - analitycznie)

LU_1_blad = abs(x_LU_1 - analitycznie)

LU_2_blad = abs(x_LU_2 - analitycznie)

QR_1_blad = abs(x_QR_1 - analitycznie)

QR_2_blad = abs(x_QR_2 - analitycznie)

SVD_blad = abs(x_SVD - analitycznie)

% Najlepsza metoda rozk³ad QR wersja 1

%
% WskaŸnik uwarunkowania
%
v = ones(1, 10)
v = v * 10^-3;
A = diag(v);
det(A)
cond(A)
