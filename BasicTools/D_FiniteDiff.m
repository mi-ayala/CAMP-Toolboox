function DF = D_FiniteDiff(F,x, tol)

    x = reshape(x, (:, 1));

    h = tol;
    m = length(x);
    E = Matrix(1.0I, m, m);

    DF = zeros(m,m);

    for j in 1:m
        xh = x + h*E[:,j];
        DF[:,j] = (F(xh) - F(x) )/h;
    end
    
end