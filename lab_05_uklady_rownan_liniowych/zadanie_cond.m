uwarunkowania = [];
for i=1:10
    A = diag(ones(1, i));
    A(find(tril(ones(i,i), -1))) = -1;
    uwarunkowania = [uwarunkowania cond(A, Inf)];
end

plot(uwarunkowania)

% [1,4,12,32,80,192,448,1024,2304,5120]
% Ze skryptu który wygenerowa³ kolejne wskaŸniki uwarunkowania wnioskujê,
% ¿e wskaŸnik uwarunkowania macierzy o rozmiarze n x n wynosi
%
%               n * 2^(n-1)