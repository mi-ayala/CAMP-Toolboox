function  f=EvalTaylor(TaylorCoeff,t)
%%%% General Taylor evaluation Function at times t
%%%% Input 
%%%% x Taylor coefficients
%%%% t Time domain 
%%%% Output 
%%%% F(t)

    t= reshape(t,1,[]);
    N = length(TaylorCoeff)-1;
    TaylorCoeff = reshape(TaylorCoeff,1,[]);
   
    tMatrix = repmat(t, N+1,1);
    expMatrix = repmat((0:N)', 1, length(t)  );
    coeffMatrix = repmat(TaylorCoeff', 1, length(t)  );
    
    f= sum(coeffMatrix.*(tMatrix.^expMatrix));
    

end