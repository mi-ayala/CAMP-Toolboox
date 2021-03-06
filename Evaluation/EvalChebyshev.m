function  R = EvalChebyshev(chebcoeffs,t)
    %%%% General Chebyshev evaluation Function at times t
    % ================================================
    % Nov 2021, Miguel Ayala.
    % ================================================
    
        %% Inputs Cheb coeffs. 
        %% Evaluation point in [-1,1]. It could be a row. 
        %% Two options, Chebfn or symbolic toolbox
        %% Note the 2 factor in front of all expansion terms > 0
    
        t =reshape(t,[],1);
        chebcoeffs = reshape(chebcoeffs,1,[]);

        M = length(chebcoeffs) - 1;
        t_evaluations = length(t);
        
        
        %%% ChebCoeffs
        ChebC = repmat( chebcoeffs(2:end) , t_evaluations,1 );
        
        %%% Chebpolynomials
        
        ChebP = zeros(t_evaluations, M);
        
        for i = 1: M
        
        %   %%% Using Chebfun
        %      T = chebpoly(i);
        %      ChebP(:,i) = T(t);
            
            %%% Using symbolic toolbox
             ChebP(:,i) = chebyshevT(i,t);
             
        end    
        

        R = chebcoeffs(1) + sum(  2.*ChebC.*ChebP,2);
       
    
end