
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

   %%% First with nu = 1
   %%% Split in horizontal blocks

   %%% Total number of modes including zero
   M = length(a(1,;))/NumVar;
   
   index = [ones(M,1); zeros(M*(NumVar-1),1)];

   %%% Block by block
   Norm = 0;

   for i = 0:NumVar-1  

    index = circshift(a, i);
    Norm = Norm + max(abs(a)*index);

   end
   
end  