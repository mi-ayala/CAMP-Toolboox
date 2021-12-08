
function EvaluationMatrix = EvalTaylorFourier(TF, sigma, theta,L)
%%%   INPUT   
%%%   TF Taylor-Fourier Coeff Matrix (Each row is the  Fourier expansion of a Taylor coeff)
%%%   sigma Taylor domain
%%%   theta Fourier domain
%%%   L = 2pi/Period
% ================================================
% Nov 2021, Miguel Ayala.
% ================================================
    N = length(TF(:,1)) -1;

    TaylorMatrix = zeros(N+1,length(theta));

    for i=0:N
    %%%% Each row is a sequence of Fourier coefficients 
        TaylorMatrix(1 + i, :) = EvalFourier(L,TF(1+i,:),theta);
    end    

    EvaluationMatrix = zeros(length(sigma),length(theta));
    for i = 1:length(theta)
        %%%% Each column is a sequence of Taylor coefficients 
        EvaluationMatrix(:, i) = EvalTaylor(TaylorMatrix(:,i),sigma);
    end  

end   
