function  [core, tail] = SplitVarible(x, m_truncated, structure)
%  ==================================================
%  Split
%  ==================================================
%  DESCRIPTION Split variable in core and tail.
%  __________________________________________________
%  INPUT 
%  x .. Full extended variable
%  m_tuncrated .. truncation modes
%  structure .. 
%  [number of extraVar,  number of seqVar, 2] for 2-sided seq.
%  [number of extraVar,  number of seqVar, 1] for 1-sided seq.
%  __________________________________________________
%  OUTPUT
%  core .. core part of the variable
%  tail .. tail part of the variable
%  __________________________________________________
%  MATLAB 9.11.0.1837725 (R2021b) Update 2
%  Miguel Ayala, 10-Feb-2022.
%  ==================================================

    [var extravar m] = StructureVariable(x, structure);
    tail_size = m - m_truncated;
    numVar = structure(2);

    %%% 2-sided
    if structure(3) == 2

        tail = [ones( tail_size ,numVar); zeros( 2*m_truncated + 1,numVar); ones( tail_size ,numVar) ];
        core = ~tail;
        
        core = var.*core;
        tail = var.*tail;

    else
    %%% 1-sided    
        tail = [zeros( 2*m_truncated + 1,numVar); ones( tail_size ,numVar) ];
        core = ~tail;

        core = var.* core;
        tail = var.*tail;

end  