clc
clear all
close

% zdefiniuj funkcje do minimalizacji f(x, y)
% zrob to przy pomocy polecenia syms, np. :
syms f(x, y)

% Rownanie 1
%f(x,y)=2*(x-1).^2+y.^2-1;
%[x,y] = meshgrid([-6:0.1:8],[-8:0.1:8]);

% Rownanie 2
% f(x,y)=x.^4 + y.^4 + 2*x.^2.*y -2*x + 2;
% [x,y] = meshgrid([-6:0.1:6],[-6:0.1:6]);

% Rownanie 3
f(x,y)=2*(x-1+y).^2 + (y-2).^2 + 1;
[x,y] = meshgrid([-10:0.1:10],[-10:0.1:10]);


% zdefiniuj punkt pocz¹tkowy
% zakomentowane dla rownan 1 i 2 w moim rozwiazaniu
% x0 = 5;
% y0 = -4;
% zmienilem krok pocz¹tkowy dla rownania 3 bo [5, -4] od razu znajdowa³
% rozwi¹zanie
x0 = -10
y0 = -8
f(x0,y0)
% zdefiniuj dok³adnoœæ
dok = 0.01;

% narysuj funkcjê w 3d
subplot(2, 1, 1)
mesh(x, y, double(f(x, y)))

% narysuj wykres poziomicowy podanej funkcji i zaznacz na nim punkty
% pocz¹tkowy i koñcowy oraz œcie¿kê poszukiwañ

subplot(2, 1, 2)
hold on
contour(x, y, double(f(x, y)))
plot(x0, y0, 'r*')
text(x0, y0, 'Start')

% poczatkowa baza kierunkow
d1 = [1, 0];
d2 = [0, 1];
    
% optymalizacja
while 1
    % wybierz kierunek poszukiwañ d1 = [1,0], albo d2=[0,1]
    syms df(a)
    
    % kierunek d1
    % kolejny krok
    x1 = x0 + a*d1(1);
    y1 = y0 + a*d1(2);
    
    % przechodzimy na funkcjê jednej zmiennej alfa (a)
    f1 = f(x1, y1);
    % obliczamy pierwsz¹ pochodn¹ po zmiennej a
    df(a) = diff(f1, a, 1);
    dfa = string(df(a));
    % a nasepnie rozwi¹zujemy równanie fd(a) = 0 i znadujemy a
    a = wlasny_newton(dfa, x0, dok);
    
    % aktualizacja punktu startowego
    xs = x0;
    ys = y0;
    
    X_0 = [xs, ys];
    
    x0 = x0 + a*d1(1);
    y0 = y0 + a*d1(2);
    
    X_1 = [x0, y0];
    oldx0 = x0;
    oldy0 = y0;
    plot(x0, y0, 'g.');
    
    % linia wzdluz pierwszego kierunku
    line([xs x0],[ys y0])
    
    if abs(f(x0,y0) - f(xs, ys)) < dok
        break
    end
    
    % zmiana kierunku na drugi, czyli d2
    syms df(a)
    % kierunek d2
    % kolejny krok
    x1 = x0 + a*d2(1);
    y1 = y0 + a*d2(2);
    
    % przechodzimy na funkcjê jednej zmiennej alfa (a)
    f1 = f(x1, y1);
    % obliczamy pierwsz¹ pochodn¹ po zmiennej a
    df(a) = diff(f1, a, 1);
    dfa = string(df(a));
    % a nastêpnie rozwi¹zujemy równanie fd(a) = 0 i znajdujemy a
    a = wlasny_newton(dfa,x0,dok);

    
    % aktualizacja punktu startowego
    xs = x0;
    ys = y0;
    
    x0 = x0 + a*d2(1);
    y0 = y0 + a*d2(2);
    plot(x0, y0, 'k.')
    X_2 = [x0, y0];
   
    % linia wzdluz drugiego kierunku
    line([X_1(1) X_2(1)],[X_1(2) X_2(2)])
    
    % obliczenie kierunku D3
    % z wykladu d3 = (x2-x0)/|x2-x0|
    % u nas x0 = X_0, x1 = X_1, x2 = X_2
    d3 = (X_2 - X_0)/norm(X_2 - X_0);
    % hesjan jako po³¹czenie kolumn kierunku d2 i d3
    H = [d2' d3'];
    % obliczanie liczby bewzglêdnej wyznacznika
    wyznacznik = abs(det(H));
    
    % je¿eli kierunek D3 jest sprzê¿ony do D2
    if wyznacznik > 0.7
        % minimalizacja wzd³u¿ D3
        % zmiana kierunku na trzeci, czyli d3
        syms df(a)
        % kierunek d3
        % kolejny krok
        x1 = x0 + a*d3(1);
        y1 = y0 + a*d3(2);

        % przechodzimy na funkcjê jednej zmiennej alfa (a)
        f1 = f(x1, y1);
        % obliczamy pierwsz¹ pochodn¹ po zmiennej a
        df(a) = diff(f1, a, 1);
        dfa = string(df(a));
        % a nastêpnie rozwi¹zujemy równanie fd(a) = 0 i znajdujemy a
        a = wlasny_newton(dfa,x0,dok);

        % aktualizacja punktu startowego
        xs = x0;
        ys = y0;

        x0 = x0 + a*d3(1);
        y0 = y0 + a*d3(2);
        X_3 = [x0 y0]
        plot(x0, y0, 'k.')

        % linia wzdluz trzeciego kierunku
        line([X_2(1) X_3(1)],[X_2(2) X_3(2)])
        
        % podmiana bazy na d2 i d3
        d1 = d2;
        d2 = d3;
    end

end
plot(x0, y0, 'b*')

        