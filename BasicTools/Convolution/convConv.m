function a1a2 = convConv(a1,a2)
    %%% For two-sided sequences
    % ================================================
    % Nov 2021, Miguel Ayala.
    % ================================================

      M = (length(a1)-1)/2;
      a1a2 = conv(a1,a2);
      a1a2 = reshape(a1a2(2*M+1: end ),[],1);
    
end
