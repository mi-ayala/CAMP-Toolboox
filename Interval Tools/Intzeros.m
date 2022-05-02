function  A = Intzeros(a,b, intswitch)
%  ==================================================
%  Intzeros
%  ==================================================
%  DESCRIPTION Creates zeros(a,b) or  
%              intval(zeros(a,b)) depending on input.
%  __________________________________________________
%  INPUT
%  a .. Positive interger
%  b .. Positive interger
%  int ...  Interval switch
%  __________________________________________________
%  OUTPUT
%  A .. array of zeros. It is an interval if a is an 
%  interval.
%  __________________________________________________
%  MATLAB 9.11.0.1837725 (R2021b) Update 2
%  Miguel Ayala, 10-Feb-2022.
%  ==================================================

    if intswitch==0 
    
        A = zeros(a,b);
    
    else
    
        A = intval(zeros(a,b));

    end    


end  