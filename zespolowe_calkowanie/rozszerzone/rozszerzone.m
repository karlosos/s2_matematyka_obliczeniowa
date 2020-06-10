%
% Obliczanie objêtoœci dowolnego kszta³tu za pomoc¹ metody Monte Narlo
%
% Wykorzystano biblioteki:
% https://www.mathworks.com/matlabcentral/fileexchange/37856-inpolyhedron-are-points-inside-a-triangulated-volume
% https://www.mathworks.com/matlabcentral/fileexchange/6678-stlread
%

clc
clear all
close all

% Okreœlenie pliku wejœciowego
filename = 'elipsoida.stl';

% [F,V,N] = STLREAD(FILENAME) also returns the face normal vectors.
% Wykorzystywane do okreœlenia granic dla Monte carlo
[F, V, N] = stlread(filename);

% FV = STLREAD(FILENAME) imports triangular faces from the binary STL file
% indicated by FILENAME, and returns the patch struct FV, with fields 'faces'
% and 'vertices'.
% Wykorzystywane do testowania, czy punkt nale¿y do figury.
FV = stlread(filename);

clf;

% Rysowanie obiektu
p = patch('faces', F, 'vertices', V);
set(p, 'FaceVertexCData', N);
set(p, 'facealpha', .4)
set(p, 'EdgeColor', 'none');
light
daspect([1 1 1])
view(3)
xlabel('X'),ylabel('Y'),zlabel('Z')
title(['plik ' filename])

% Losowanie punktów
numberOfPoints = 10000;
% Okreslenie granicy Monte Carlo
positionMax = max(V);
positionMin = min(V);
widthX = abs(positionMax(1))+abs(positionMin(1));
widthY = abs(positionMax(2))+abs(positionMin(2));
widthZ = abs(positionMax(3))+abs(positionMin(3));
X = (rand(1, numberOfPoints)).*(positionMax(1)*2)-abs(positionMin(1));
Y = (rand(1, numberOfPoints)).*(positionMax(2)*2)-abs(positionMin(2));
Z = (rand(1, numberOfPoints)).*(positionMax(3)*2)-abs(positionMin(3));

rectangleVolume = widthX * widthY * widthZ;

X = X(:);
Y = Y(:);
Z = Z(:);

Points = [X Y Z];

% Sprawdzanie które punkty s¹ wewn¹trz wieloœcianu
Inside = inpolyhedron(FV, Points);

% Rysowanie punktów
hold on
plot3(Points(Inside, 1), Points(Inside, 2), Points(Inside, 3), 'ob');
plot3(Points(~Inside, 1), Points(~Inside, 2), Points(~Inside, 3), 'or');

% Obliczenie objêtoœci
proportionInside = size(find(Inside==1), 1)/numberOfPoints;
volume = proportionInside * rectangleVolume;
disp(fprintf('Calculated volume: %d', volume));
