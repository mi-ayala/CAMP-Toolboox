
function  Norm = Operator_norm(a, nu, structure)
%  ==================================================
%  Operator_norm
%  ==================================================
%  DESCRIPTION 
%  Computes the weighted operator norm.
%  __________________________________________________
%  INPUT
%  a .. sequence
%  nu .. weight
%  structure .. variable structure
%  [number of extraVar,  number of seqVar, 2] for 2-sided seq.
%  [number of extraVar,  number of seqVar, 1] for 1-sided seq.
%  __________________________________________________
%  OUTPUT
%  Norm ..  l1 geometric-weighted norm of a
%  __________________________________________________
%  MATLAB 9.11.0.1837725 (R2021b) Update 2
%  Miguel Ayala, 08-Feb-2022.
%  ==================================================

  %%% This part is not actually need it, but it is nice to always include
  %%% the structure of the variable for each problem
    ExtraVar = structure(1);
    NumVar = structure(2);
    SequenceStructure = structure(3);

   %%%% Number of modes 
   [m, M] = GetNumModes(a(1,;),  structure);

   %%%% Weights

    if SequenceStructure == 1
        %index = 0:m;
        exponent1 = repmat((0:m)', 1 ,M);
        w = nu.^abs(exponent1);
        aw = abs(a).*w;
        exponent2 = 1./abs((0:m)');

    else
        %index = -m:m;
        exponent1 = repmat((-m:m)', 1 ,M);
        w = nu.^abs(exponent1);
        aw = abs(a).*w;
        exponent2 = 1./abs((-m:m)');
    end    

   %%% First with nu = 1
   %%% Split in horizontal blocks
   index = [ones(M,1); zeros(M*(NumVar-1),1)];

   %%% Block by block
   Norm = 0;

   for i = 0:NumVar-1  

    index = circshift(a, i);
    Norm = Norm + max(exponent2.*(aw*index));

   end
   
end  