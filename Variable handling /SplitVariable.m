function  [core, tail] = SplitVarible(x, m_truncated, structure)
%  ==================================================
%  Split
%  ==================================================
%  DESCRIPTION Split variable in core and tail.
%  __________________________________________________
%  INPUT
%  __________________________________________________
%  OUTPUT
%  __________________________________________________
%  MATLAB 9.11.0.1837725 (R2021b) Update 2
%  Miguel Ayala, 10-Feb-2022.
%  ==================================================

[var ~ m] = StructureVariable(x, structure)
tail_size = m - m_truncated;
numVar = structure(2);

tail = [ones( tail_ size ,numVar) zeros( 2*m_truncated, tail_ size ,numVar) ones( tail_ size ,numVar) ];
core = ~tail;


%%% Two sided
if structure(3) == 2

    tail = [ones( tail_ size ,numVar) zeros( 2*m_truncated, tail_ size ,numVar) ones( tail_ size ,numVar) ];
    core = ~tail;
    
    core = var.*core;
    tail = var.*tail;

else

    tail = [zeros( 2*m_truncated, tail_ size ,numVar) ones( tail_ size ,numVar) ];
    core = ~tail;

    core = var.* core;
    tail = var.*tail;

end  