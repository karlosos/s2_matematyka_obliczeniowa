function [wyznacznik] = chio(A,mnoznik)
    [n, ~ ] = size(A);
    
    if (A(1,1) == 0)
        % szukanie wiersza z niezerowym elementem
        wiersz_zamiany = 2;
        while (A(wiersz_zamiany, 1) == 0)
            wiersz_zamiany = wiersz_zamiany +1;
        end
        % zamiana wierszy
        tmp = A(1, :);
        A(1, :) = A(wiersz_zamiany, :);
        A(wiersz_zamiany, :) = tmp;
        % zmiana znaku
        mnoznik = -mnoznik;
    end
    
    A_new = zeros(n-1, n-1);
    for i=1:n-1
        for j=1:n-1
            A_new(i, j) = A(1, 1) * A(i+1, j+1) - (A(i+1, 1) * A(1, j+1));
        end
    end
    mnoznik = 1/A(1, 1)^(n-2) * mnoznik;
    A_new;
    if (n-1==2)
        wyznacznik = mnoznik * (A_new(1, 1) * A_new(2, 2) - (A_new(1, 2) * A_new(2, 1)));
        return
    else
        wyznacznik = chio(A_new, mnoznik);
        return
    end
end
