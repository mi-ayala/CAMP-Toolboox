function a1a2 = convToeplitz(a1,a2)
    %%% For two-sided sequences
    % ================================================
    % Nov 2021, Miguel Ayala.
    % ================================================

    a1 = reshape(a1,1,[]);
    a2 = reshape(a2,[],1);
    m = length(a1);

    c = [a1(m:-1:2),a1,zeros(1,2*m)];
    r = [c(1),zeros(1,length(a2)-1)]; 
    M = toeplitz(c,r);

    S = M*a2;
    S = S((2*m-1):end);
    
    a1a2 = S(1:m);
     
        
end
