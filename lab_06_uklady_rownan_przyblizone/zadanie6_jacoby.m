clear all
e = 0.001;
czasy = []
iteracje = []
for n=[10 100 200 500 1000 2000 3000 5000]
    A=rand(n,n);
    A=A+n*eye(n);
    X=ones(n,1);
    b=A*X;
   
    % Wyznaczenie przekszta³conych macierzy W i Z
    W=A;
    Z=b;
    WZ=[A,Z]; % macierz A i do³¹czona macierz Z
    n=max(size(A));
    for i=1:n
       for j=1:n
          if i==j
             WZ(i,:)= WZ(i,:)./W(i,i);
             WZ(i,1:n)=WZ(i,1:n)*(-1);
             WZ(i,i) = 0;
          end
       end
    end
    W=WZ(:,1:n);
    Z=WZ(:,end);

    % startowe
    x=zeros(n,1);
    
    tic
    kontynuuj = true;
    i = 0;
    while (kontynuuj)
        i = i+1;
        x_previous = x(:, i);
        x_new = W  * x_previous + Z;
        x = [x x_new];
        d=max(abs(x(:,i+1)-x(:,i)));
        if (d < e)
            kontynuuj = false;
        end
    end
    iteracje = [iteracje i]
    czasy = [czasy toc]
end
