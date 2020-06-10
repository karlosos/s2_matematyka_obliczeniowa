% jesli wylosowany punkt znajduje sie wenatrz sali to zostaje dodany
% do calkowitej sumy trafionych punktow

clc
clear all
close all

% rysowanie sali
bryla
hold on

% generator losowych punktow
ilosc_punktow = 10000;
X = (rand(1, ilosc_punktow))*655;
Y = (rand(1, ilosc_punktow))*(439+133);
Z = (rand(1, ilosc_punktow))*273;

ile_trafionych = 0;
objetosc_przestrzeni = 655 * (439+133) * 273;

% okreslenie granicy kubatury sali
for i = 1:1:ilosc_punktow
    if Z(i) <= 273 && Y(i) <= 352 && X(i) <= 655
        plot3(X(i),Y(i),Z(i), '*g');
        ile_trafionych = ile_trafionych + 1;
    elseif Z(i) <= 210 && Y(i) <= (439+133) && Y(i) >= 439 && X(i) >= 385 && X(i) <= 655-76
        plot3(X(i),Y(i),Z(i), '*g');
        ile_trafionych = ile_trafionych + 1;
    elseif Z(i) <= interp2([655 0], [352 439], [273 273; 191 191], X(i), Y(i), 'cubic')
        plot3(X(i),Y(i),Z(i), '*g');
        ile_trafionych = ile_trafionych + 1;
    else
        plot3(X(i),Y(i),Z(i), '*r');
    end
end

% koncowa objetosc obliczana jest ze wzoru
% ilosc_trafionych/ilosc_punktow * objetosc przestrzeni
wynik = (ile_trafionych/ilosc_punktow) * objetosc_przestrzeni;
disp(sprintf('Kubatura sali wynosi: %d', wynik));

