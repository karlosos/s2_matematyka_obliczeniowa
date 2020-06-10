function xk = wlasny_newton(f, x0, dok)
f2 = inline(f);
h = 1/2^3;
df1 = @(a)(f2(a+h)-f2(a-h))/(2*h);

xk = x0-f2(x0)/df1(x0);

while abs(xk-x0)>dok
    x0= xk;
    xk = x0-f2(x0)/df1(x0);
end

xk
