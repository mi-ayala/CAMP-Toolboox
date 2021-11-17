
function EvaluationMatrix = EvalTaylorFourier(TF, sigma, theta,L)

    N = length(TF(:,1)) -1;

    TaylorMatrix = zeros(N+1,length(theta));

    for i=0:N
    %%%% Each column is a set of Taylor coefficients 
        TaylorMatrix(1 + i, :) = EvalFourier(L,TF(1+i,:),theta);
    end    

    EvaluationMatrix = zeros(length(sigma),length(theta));
    for i = 1:length(theta)
        %%%% Each column is a set of Taylor coefficients 
        EvaluationMatrix(:, i) = EvalTaylor(TaylorMatrix(:,i),sigma);
    end  

end   