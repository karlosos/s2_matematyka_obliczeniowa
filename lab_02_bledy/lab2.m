% format short
% format long e
% single(...) 
clear all

%
% % Zadanie 1
% %
% 
% % double
% format long e
% % A1
% tic
% s = 0;
% for i = 1:10^6
%     s = s + i;
% end
% toc
% S_A1 = s
% 
% 
% % A2
% tic
% A = 1:10^6;
% S_A2 = sum(A);
% toc
% S_A2
% 
% % Kahana A3
% tic
% x = 1:1:10^6;
% n = length(x);
% S = x(1);
% C = 0;
% 
% 
% for i = 2:n
%     Y = x(i) - C;
%     T = S + Y;
%     C = (T-S) - Y;
%     S = T;
% end
% toc
% S_A3 = S
% 
% % Gilla Mollera
% tic
% x = 1:1:10^6;
% n = length(x);
% S = 0;
% U = 0;
% P = 0;
% for i = 1:n
%     S = U + x(i);
%     P = U - S + x(i) + P;
%     U = S;
% end
% S_A4 = S + P;
% toc
% S_A4
% 
% % single
% 
% format long e
% % A1
% tic
% s = single(0);
% for i = single(1:10^6)
%     s = single(s + i);
% end
% toc
% S_A1 = single(s)
% 
% 
% % A2
% tic
% A = single(1:10^6);
% S_A2 = single(sum(A));
% toc
% S_A2
% 
% % Kahana A3
% tic
% x = single(1:1:10^6);
% n = single(length(x));
% S = single(x(1));
% C = single(0);
% 
% 
% for i = single(2:n)
%     Y = single(x(i) - C);
%     T = single(S + Y);
%     C = single((T-S) - Y);
%     S = single(T);
% end
% toc
% S_A3 = single(S)
% 
% % Gilla Mollera
% tic
% x = single(1:1:10^6);
% n = single(length(x));
% S = single(0);
% U = single(0);
% P = single(0);
% for i = single(1:n)
%     S = single(U + x(i));
%     P = single(U - S + x(i) + P);
%     U = single(S);
% end
% S_A4 = single(S + P);
% toc
% S_A4
% 
% %
% % ró¿nice
% %
% suma_true = (1+10^6)/2 * 10^6
% y = [abs(S_A1 - suma_true), abs(S_A2 - suma_true), abs(S_A3 - suma_true), abs(S_A4 - suma_true)]
% bar(y)

%
% Zadanie 2
%
% single

% input_v = [10^6, 0.2, 0.2, 0.2, -10^6]
% format long e
% % A1
% tic
% s = single(0);
% for i = single(input_v)
%     s = single(s + i);
% end
% toc
% S_A1 = single(s)
% 
% 
% % A2
% tic
% A = single(input_v);
% S_A2 = single(sum(A));
% toc
% S_A2
% 
% % Kahana A3
% tic
% x = single(input_v);
% n = single(length(x));
% S = single(x(1));
% C = single(0);
% 
% 
% for i = single(2:n)
%     Y = single(x(i) - C);
%     T = single(S + Y);
%     C = single((T-S) - Y);
%     S = single(T);
% end
% toc
% S_A3 = single(S)
% 
% % Gilla Mollera
% tic
% x = single(input_v);
% n = single(length(x));
% S = single(0);
% U = single(0);
% P = single(0);
% for i = single(1:n)
%     S = single(U + x(i));
%     P = single(U - S + x(i) + P);
%     U = single(S);
% end
% S_A4 = single(S + P);
% toc
% S_A4
% 
% %
% % ró¿nice
% %
% suma_true = 0.6
% y = [abs(S_A1 - suma_true), abs(S_A2 - suma_true), abs(S_A3 - suma_true), abs(S_A4 - suma_true)]
% bar(y)

% double
% 
% input_v = [10^6, 0.2, 0.2, 0.2, -10^6]
% format long e
% % A1
% tic
% s = 0;
% for i = input_v
%     s = s + i;
% end
% toc
% S_A1 = s
% 
% 
% % A2
% tic
% A = input_v;
% S_A2 = sum(A);
% toc
% S_A2
% 
% % Kahana A3
% tic
% x = input_v;
% n = length(x);
% S = x(1);
% C = 0;
% 
% 
% for i = 2:n
%     Y = x(i) - C;
%     T = S + Y;
%     C = (T-S) - Y;
%     S = T;
% end
% toc
% S_A3 = S
% 
% % Gilla Mollera
% tic
% x = input_v;
% n = length(x);
% S = 0;
% U = 0;
% P = 0;
% for i = 1:n
%     S = U + x(i);
%     P = U - S + x(i) + P;
%     U = S;
% end
% S_A4 = S + P;
% toc
% S_A4
% 
% %
% % ró¿nice
% %
% suma_true = 0.6
% y = [abs(S_A1 - suma_true), abs(S_A2 - suma_true), abs(S_A3 - suma_true), abs(S_A4 - suma_true)]
% bar(y)

%
% Zadanie 3
%
X = [exp(1), -pi, sqrt(2), -psi(1), log10(2)];
Y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049];

% W1
W1 = X * Y'

% W2
W2 = sum(X .* Y)

% W3
W3 = 0;
for i=1:5
    W3 = W3 + X(i) * Y(i);
end
W3

% W4
W4 = 0;
for i=5:-1:1
    W4 = W4 + X(i) * Y(i);
end
W4

% W5
W5 = 0;
for i=2:2:5
    W5 = W5 + X(i) * Y(i);
end
for i=1:2:5
    W5 = W5 + X(i) * Y(i);
end
W5

Y = [abs(W1-W1), abs(W1-W2), abs(W1-W3), abs(W1-W4), abs(W1-W5)]
bar(Y)
