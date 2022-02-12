function  [var extraVar m] = StructureVariable(x, structure)
%  ==================================================
%  StructureVariable
%  ==================================================
%  DESCRIPTION To better deal with extended variables
%  __________________________________________________
%  INPUT
%  __________________________________________________
%  OUTPUT
%  __________________________________________________
%  MATLAB 9.11.0.1837725 (R2021b) Update 2
%  Miguel Ayala, 11-Feb-2022.
%  ==================================================
  
ExtraVar = structure(1);
SequenceVar = structure(2):
SequenceStructure = structure(3);

var = reshape(x(ExtraVar + 1, end), SequenceVar, []);
extraVar = x(1:ExtraVar);

%%% Number of modes, not including zero mode.
if SequenceStructure == 1
    m = length(var(:,1)) - 1;
else  
    m = (length(var(:,1)) - 1)/2;
end    


end  