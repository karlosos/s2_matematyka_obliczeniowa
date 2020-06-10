A = [-5, -100, 0, 0;
    0.5, -1.15, -1.1, 0.15;
    0, 0, -0.04, 0;
    0, 0.0055, 0.0036, -0.0063]

%zad2
wyznacznikA = det(A)
%zad3
wwA = eig(A)
%zad4
iloczyn=1;
for i=1:length(wwA)
    iloczyn=iloczyn*wwA(i);
end
iloczyn
ilo=prod(wwA)
%zad5
invA = inv(A)
%zad6
upperA = triu(A)
lowerA = tril(A)
%zad7
traceA = trace(A)

clc;
clear all;
close all;

%cwiczenie 2
%zad1
A = [1, 1, 2;
    2, 1, 4;
    3, 0, 6]
%zad2
rankA = rank(A)
%zad3
wwA = eig(A)
%zad4
sumWWA = sum(wwA)
%zad5
wWChar = poly(A)
%zad6
pWChar = roots(wWChar)
%zad7 porownaj
%zad8
traceA = trace(A)
%zad9 porownac

clc;
clear all;
close all;

format long e
%cwiczenie 3
%zad1
A = [1, -1, 2;
    2, 1, -4;
    3, 0, 6]
%zad2
wWChar = poly(A)
%zad3
pWChar = roots(wWChar)
%zad4
real_z = real(pWChar);
imag_z = imag(pWChar);
%zad5
plot(real_z,imag_z,'bx')

clc;
clear all;
close all;

%cwiczenie 4
%zad1
A = [0, 1;
    -2, -3]
W = eig(A)
[b,a] = eigs(A)

clc;
clear all;
close all;

%cwiczenie5
%zad1
A = [1, 1, 1;
    2, 1, -1;
    2, 0, 2]
%zad2
%wartosci wlasne
%WW = eigs(A)
[S,a]=eigs(A)
%wektory wlasne

%zad3
wyznacznikA = det(A)

%zad4
B = inv(S)*A*S
diag(B)
%zad6
wyznacznikB = det(B)