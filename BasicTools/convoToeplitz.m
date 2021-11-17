function S = convoToeplitz(a1,a2)
% a2 must be a column vector
% Try padding with zeros and using conv function.To compare.

    [m,n] = size(a1);
    
    if n==1
        a1=a1';
    else
        a2=a2'; 
        m=n;
    end

    c = [a1(m:-1:2),a1,zeros(1,2*m)];
    r = [c(1),zeros(1,length(a2)-1)]; 
    M = toeplitz(c,r);

    S = M*a2;
    S = S((2*m-1):end);
    
    
end

%%%%% Example
  M = 2

  a1 = [ 3 4 5]
  a2 = [ 6 7 8]

  a1 = [ 5 4 3 4 5]
  a2 = [ 8 7 6 7 8]
    
  a1a2 = conv(a1,a2)
  a1a2 = a1a2(2*M+1: end )
