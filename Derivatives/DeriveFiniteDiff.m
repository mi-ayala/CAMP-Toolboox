function DF = DeriveFiniteDiff(F,x, tol)
%  ==================================================
%  DeriveFiniteDiff
%  ==================================================
%  DESCRIPTION
%  Computes DF with Finite differences up to a 
%  tolerance tol at x
%  __________________________________________________
%  INPUT
%  F   .. Function 
%  tol .. Tolerance for finite differences
%  __________________________________________________
%  OUTPUT
%  DF .. Finite differences derivative  
%  __________________________________________________
%  MATLAB 9.11.0.1809720 (R2021b) Update 1
%  Miguel Ayala, 05-Jan-2022.
%  ==================================================

    x = reshape(x, [], 1);

    h = tol;
    m = length(x);
    E = eye(m, m);

    DF = zeros(m,m);

    for j = 1:m
        xh = x + h*E(:,j);
        DF(:,j) = (F(xh) - F(x) )/h;
    end
    
end
