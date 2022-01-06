function  [nullity_QR,null_space] = TestInvertibility(A)
%  ==================================================
%  InvertibilityTest
%  ==================================================
%  DESCRIPTION  Computes condition number and kernel
%  __________________________________________________
%  INPUT        Square matrix
%  __________________________________________________
%  OUTPUT       Condition number and basis for 
%               the kernel.
%  __________________________________________________
%  MATLAB 9.11.0.1809720 (R2021b) Update 1
%  Miguel Ayala, 05-Jan-2022.
%  ==================================================

    %%% How close to zero are the zero eigenvalues?
    tol = 1e-6;

    %%% Condition Number
    condition_Number = cond(A)^-1
    
    %%% Eig 
    [V,D] = eig(A);
    kernel_index = find(abs(diag(D))<tol==1);
    null_space = V(:,kernel_index)
       
    %%% QR decomposition
    [~,R] = qr(transpose(A));
    nullity_QR = sum(abs(diag(R)) < tol);


end  