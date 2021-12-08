function f = EvalFourier(L,x,t)
%%%% General Fourier evaluation Function
%%%% Input 
%%%% L 2pi/Period
%%%% x Fourier coefficients
%%%% t [0 .. Period]
% ================================================
% Nov 2021, Miguel Ayala.
% ================================================
    a = real(x);
    b = imag(x);

    a = reshape(a,[],1);
    b = reshape(b,[],1);
    t = reshape(t,[],1);

    t_steps = length(t);
    m= ( length(a)-1)/2;
        
    f = zeros(t_steps,1);   
    
    for k = -m:m
        %f = f + a(k + m +1)*cos(k*L.*t) + b(k + m +1)*sin(k*L.*t);
        f =  f  + real( (a(k + m +1) + 1i*b(k + m +1))*(cos(k*L.*t) + 1i*sin(k*L.*t)) );
    end
    

end


