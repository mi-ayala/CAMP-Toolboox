function  [m, M] = GetNumModes(a, structure)
%  ==================================================
%  GetNumModes
%  ==================================================
%  DESCRIPTION Gets the number of modes excluding zero.
%  __________________________________________________
%  INPUT
%  a .. variable
%  structure .. variable structure
%  [number of extraVar,  number of seqVar, 2] for 2-sided seq.
%  [number of extraVar,  number of seqVar, 1] for 1-sided seq.
%  __________________________________________________
%  OUTPUT
%  m .. Number of modes excluding zero
%  M .. Total number of modes
%  __________________________________________________
%  MATLAB 9.11.0.1837725 (R2021b) Update 2
%  Miguel Ayala, 15-Feb-2022.
%  ==================================================

    a = reshape([],1);
    ExtraVar = structure(1); %%% No need of this one
    SequenceVar = structure(2);
    SequenceStructure = structure(3);

    %%% Total number of modes
    M = length(a(:,1))/SequenceVar;

    %%% Number of modes, not including zero mode.
    if SequenceStructure == 1
        m = M - 1;
    else  
        m = (M - 1)/2;
    end   


end  