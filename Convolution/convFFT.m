function s = convFFT(a1,a2)
%  ==================================================
%  convFFT
%  ==================================================
%  DESCRIPTION 
%  Convolution for one-sided sequences.
%  __________________________________________________
%  INPUT
%  a1   .. one-sided sequence 
%  a2   .. one-sided sequence
%  __________________________________________________
%  OUTPUT
%  a1a2 .. Truncated convolution a1*a2 
%  __________________________________________________
%  Nov 2021, Miguel Ayala.
%  ==================================================
    
        a1 = reshape(a1,[],1);
        a2 = reshape(a2,[],1);
    
        m = length(a1);
        
        b1 = flipdim(a1(2:m),1);
        ta1 = [zeros(m,1);b1;a1;zeros(m,1)];
        tu1 = ifft(ifftshift(ta1));
        
        b2 = flipdim(a2(2:m),1);
        ta2 = [zeros(m,1);b2;a2;zeros(m,1)];
        tu2 = ifft(ifftshift(ta2));
        
        F = fftshift(fft(tu1.*tu2));
        
        s = real((4*m-1)*F(2*m:3*m-1));
    end
