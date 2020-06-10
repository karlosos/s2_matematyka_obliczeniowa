clear all
czasy = []
for n=[10 100 200 500 1000 2000 3000 5000]
    A=rand(n,n);
    A=A+n*eye(n);
    X=ones(n,1);
    b=A*X;
    tic
    x = A\b;
    czasy = [czasy toc]
end


%
% wykresy
% 

Gauss = [0.0003 0.0005 0.0007 0.0045 0.0253 0.1356 0.4256 1.6152]
Jacoby = [0.0032 0.0017 0.0014 0.0032 0.0043 0.0144 0.0343 0.0911]
GaussSeidl = [0.0026 0.0020 0.0043 0.0353 0.1031 0.3878 0.8463 2.5524]

rozmiary = [10 100 200 500 1000 2000 3000 5000]
plot(rozmiary, Gauss)
hold on
plot(rozmiary, Jacoby)
plot(rozmiary, GaussSeidl)
legend('Gauss', 'Jacoby', 'GaussSeidl')


Gauss = [0.0003 0.0005 0.0007 0.0045 0.0253 0.1356 0.4256 1.6152]
Jacoby = [0.0037 0.0031 0.0043 0.0029 0.0093 0.0354 0.0875 0.2310]
GaussSeidl = [0.0033 0.0016 0.0061 0.0273 0.0974 0.3609 0.8500 2.5823]

rozmiary = [10 100 200 500 1000 2000 3000 5000]
plot(rozmiary, Gauss)
hold on
plot(rozmiary, Jacoby)
plot(rozmiary, GaussSeidl)
legend('Gauss', 'Jacoby', 'GaussSeidl')