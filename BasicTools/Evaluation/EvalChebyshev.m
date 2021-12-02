function  f = EvalChebyshev(TaylorCoeff,t)
    %%%% General Chebyshev evaluation Function at times t
    % ================================================
    % Nov 2021, Miguel Ayala.
    % ================================================
    
        % x est un vecteur colonne et n un entier plus grand ou egal à 0
        %fonction qui évalue recursivement T_0,T_1,....T_n où T sont les polynomes de Chebychev
        %en utilisant la formule de recurrence: T_0=1, T_1=x et 
        %T_n= 2*x*T_(n-1) -T_(n-2)
        % la matrice X  est sous la forme [T_0(x),T_1(x),...,T_n(x)]
        
        if n==0
            M=ones(length(y),1);        
        end
        if n==1
            M=[ones(length(y),1),y];
        end
        if n>=2
            M1=evalCheby(y,n-1); %la derniere colonne sera T_n-1 et l'avant dernière T_n-2 ?????
            M= [M1, 2*y.*M1(:,end)-M1(:,end-1)];
        end

        
    
end