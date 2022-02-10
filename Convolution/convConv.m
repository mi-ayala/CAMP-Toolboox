function a1a2 = convConv(a1,a2)
%  ==================================================
%  convConv
%  ==================================================
%  DESCRIPTION 
%  Convolution for one-sided sequences.
%  __________________________________________________
%  INPUT
%  a1   .. one-sided sequence 
%  a2   .. one-sided sequence
%  __________________________________________________
%  OUTPUT
%  a1a2 .. Full convolution a1*a2 
%  __________________________________________________
%  NOTES
%  If m = length(a1) = length(a2), cut a1a2(1:m)
%  __________________________________________________
%  Nov 2021, Miguel Ayala.
%  ==================================================

      %%% Handling input
      m = length(a1);  
      a1 = reshape(a1,1,[]);
      a2 = reshape(a2,[],1);
      a1 = [a1(m:-1:2),a1];
      a2 = [a2(m:-1:2);a2];

      %%% Computing convolution
      M = (length(a1)-1)/2;
      a1a2 = conv(a1,a2);
      a1a2 = reshape(a1a2(2*M+1: end ),[],1);
    
end
