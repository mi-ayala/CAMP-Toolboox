function  [Dfx, Dfx_FD] = CompareFiniteDiff(f,n,tol)
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
%  Dfx    .. Implemented derivative
%  Dfx_FD .. Finite differences derivative  
%  __________________________________________________
%  NOTES
%  If the function fail it usually means that the
%  the implemationsof the derivative is wrong.
%  Use with an small number of inputs.
%  __________________________________________________
%  MATLAB 9.11.0.1809720 (R2021b) Update 1
%  Miguel Ayala, 06-Jan-2022.
%  ==================================================

    x = rand(n,1);
     
    [~, Dfx] = f(x);
    
    Dfx_FD = DeriveFiniteDiff(f, x, tol);
    
    Norm_of_difference = norm(abs(Dfx_FD) - abs(Dfx), inf);

    fprintf([ '\n'...
    'CompareFiniteDiff: Infinity norm of the difference is %g.' ...
    '\n' ...
    ], [Norm_of_difference]);  

end  