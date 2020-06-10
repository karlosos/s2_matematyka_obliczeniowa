function [wyznacznik] = elementarne(A)
    [n, ~] = size(A);
    mnoznik = 1;
    for i=1:n-1
        if (A(i,i) == 0)
            % szukanie wiersza z niezerowym elementem
            wiersz_zamiany = i+1;
            while (A(wiersz_zamiany, i) == 0)
                wiersz_zamiany = wiersz_zamiany +1;
            end
            % zamiana wierszy
            tmp = A(i, :);
            A(i, :) = A(wiersz_zamiany, :);
            A(wiersz_zamiany, :) = tmp;
            % zmiana znaku
            mnoznik = -mnoznik;
        end
        
        mnoznik = mnoznik * A(i, i);
        A(i, :) = A(i, :)/A(i, i);
        for j=i+1:n
            A(j, :) = A(j, :) - A(j, i) * A(i, :);
        end
        A;
    end
    wyznacznik = mnoznik * prod(diag(A));
end
