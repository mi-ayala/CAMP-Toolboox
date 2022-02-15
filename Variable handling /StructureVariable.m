function  [var extraVar] = StructureVariable(x, structure)
%  ==================================================
%  StructureVariable
%  ==================================================
%  DESCRIPTION To better deal with extended variables
%  __________________________________________________
%  INPUT
%  x .. Full extended variable
%  structure .. 
%  [number of extraVar,  number of seqVar, 2] for 2-sided seq.
%  [number of extraVar,  number of seqVar, 1] for 1-sided seq.
%  __________________________________________________
%  OUTPUT
%  var .. Sequence variables  by columns
%  extraVar .. extra variables vector
%  m .. number of modes, not including zero
%  __________________________________________________
%  MATLAB 9.11.0.1837725 (R2021b) Update 2
%  Miguel Ayala, 11-Feb-2022.
%  ==================================================
  
    ExtraVar = structure(1);
    SequenceVar = structure(2);
    SequenceStructure = structure(3);

    var = reshape(x(ExtraVar + 1: end), [],SequenceVar);
    extraVar = x(1:ExtraVar);

    % %%% Number of modes, not including zero mode.
    % There is a function for this.
    % if SequenceStructure == 1
    %     m = length(var(:,1)) - 1;
    % else  
    %     m = (length(var(:,1)) - 1)/2;
    % end    


end  