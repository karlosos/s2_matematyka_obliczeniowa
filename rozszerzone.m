%
% Ten kod ma obliczyæ objetosc dla dowolnego ksztaltu.
% Kod podjebany z tego co barcz pokazywala.
% Nie dzia³a dobrze. Przyjrzeæ siê temu.
% Poprawiæ i ogarn¹æ jak dzia³a.
% https://www.mathworks.com/matlabcentral/fileexchange/37856-inpolyhedron-are-points-inside-a-triangulated-volume
% https://www.mathworks.com/help/matlab/ref/inpolygon.html

clc
clear all
close all

% Uzywam stlread, ale s¹ te¿ inne readery stla
% https://www.mathworks.com/matlabcentral/fileexchange/6678-stlread
% https://www.mathworks.com/matlabcentral/fileexchange/22409-stl-file-reader

filename = 'femur.stl';

[F, V, C] = stlread(filename);
fv = stlread(filename);
clf;

p = patch('faces', F, 'vertices', V);
set(p, 'FaceVertexCData', C);
set(p, 'facealpha', .4)
set(p, 'EdgeColor', 'none');
light
daspect([1 1 1])
view(3)
xlabel('X'),ylabel('Y'),zlabel('Z')
title(['plik ' filename])

% dynamiczne obliczanie przestrzeni
ileProbek = 1000;
rozmiarMAX = max(V);
rozmiarMIN = min(V);
sredniaX = abs(rozmiarMAX(1))+abs(rozmiarMIN(1));
sredniaY = abs(rozmiarMAX(2))+abs(rozmiarMIN(2));
sredniaZ = abs(rozmiarMAX(3))+abs(rozmiarMIN(3));
X = (rand(1, ileProbek)).*(rozmiarMAX(1)*2)-abs(rozmiarMIN(1));
Y = (rand(1, ileProbek)).*(rozmiarMAX(2)*2)-abs(rozmiarMIN(2));
Z = (rand(1, ileProbek)).*(rozmiarMAX(3)*2)-abs(rozmiarMIN(3));

Objetosc = sredniaX * sredniaY * sredniaZ;
X = X(:);
Y = Y(:);
Z = Z(:);

przestrzen = [X Y Z];
V;

x = V(:, 1);
y = V(:, 2);
z = V(:, 3);

tri = delaunayn([x y z], {'QJ'});
tn = tsearchn(V, tri, przestrzen);
IsInside = ~isnan(tn);
IsInside';
indexex = find(IsInside==1);
przestrzen(indexex, :, :);

hold on
plot3(przestrzen(indexex, 1), przestrzen(indexex, 2), przestrzen(indexex, 3), 'ob');
plot3(X, Y, Z, '*y')

proc = size(indexex, 1)/ileProbek;
wynik = proc * Objetosc;
disp(sprintf('Objetosc wynosi: %d', wynik));