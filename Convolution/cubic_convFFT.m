function F = cubic_convFFT(a1,a2,a3)

        % Convolution term using FFT   

        a1 = reshape(a1,[],1);
        a2 = reshape(a2,[],1);
        a3 = reshape(a3,[],1);
    
        m = length(a1);
        
        b1 = flipdim(a1(2:m),1);
        ta1 = [zeros(m,1);b1;a1;zeros(m,1)];
        tu1 = ifft(ifftshift(ta1));
        
        b2 = flipdim(a2(2:m),1);
        ta2 = [zeros(m,1);b2;a2;zeros(m,1)];
        tu2 = ifft(ifftshift(ta2));

        b3 = flipdim(a3(2:m),1);
        ta3 = [zeros(m,1);b3;a3;zeros(m,1)];
        tu3 = ifft(ifftshift(ta3));
        
        F = (4*m -1)^2*fftshift(fft(tu1.*tu2.*tu3));


        s = F(3*m:4*m-1);

end

