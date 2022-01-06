function  [Dfx, Dfx_FD] = CompareFiniteDiff(f,n, tol)
%  ==================================================
%  CompareFiniteDiff
%  ==================================================
%  DESCRIPTION
%  Computes Df with Finite differences up to a 
%  tolerance tol at a random point 
%  and then compares (norm) with the implementation
%  of derivative given by f.
%  __________________________________________________
%  INPUT
%  f   .. Function and derivative [f, Df]
%  n   .. length for the input of f
%  tol .. Tolerance for finite differences
%  __________________________________________________
%  OUTPUT
%  Dfx    .. Derivative
%  Dfx_FD .. Finite differences derivative  
%  __________________________________________________
%  MATLAB 9.11.0.1809720 (R2021b) Update 1
%  Miguel Ayala, 06-Jan-2022.
%  ==================================================

    x = rand(n,1);
    
    [~, Dfx] = f(x);

    Dfx_FD = DeriveFiniteDiff(f, tol);

    Norm_of_difference = norm(Dfx_FD - Dfx)

end  