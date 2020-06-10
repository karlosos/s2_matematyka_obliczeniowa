load A_50
load A_100
load A_200

%
% Badanie det
%
disp('========================')
disp('det')
disp('========================')
tic
W50 = det(A_50)
toc

tic
W100 = det(A_100)
toc

tic
W200 = det(A_200)
toc

%
% Badanie chio
%
disp('========================')
disp('chio')
disp('========================')
tic
W50 = chio(A_50, 1)
toc

tic
W100 = chio(A_100, 1)
toc

tic
W200 = chio(A_200, 1)
toc

%
% Badanie elementarne
%
disp('========================')
disp('elementarne')
disp('========================')
tic
W50 = elementarne(A_50)
toc

tic
W100 = elementarne(A_100)
toc

tic
W200 = elementarne(A_200)
toc

%
% Badanie dla jak duzej macierzy dzia³a Chio
%
% for i=3:10
%     A = rand(i, i);
%     d = det(A);
%     c = chio(A, 1);
% end