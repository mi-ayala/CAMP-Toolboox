function  A = MyZero(a,b)
%  ==================================================
%  MyZero
%  ==================================================
%  DESCRIPTION Creates zeros(a,b) or  
%              intval(zeros(a,b)) depending on input.
%  __________________________________________________
%  INPUT
%  a .. Positive interger
%  b .. Positive interger
%  __________________________________________________
%  OUTPUT
%  A .. array of zeros. It is an interval if a is an 
%  interval.
%  __________________________________________________
%  MATLAB 9.11.0.1837725 (R2021b) Update 2
%  Miguel Ayala, 10-Feb-2022.
%  ==================================================

    if exist('intval','file') && isintval(a)  
    
        A = intval(zeros(a,b));
    
    else
    
        A = zeros(a,b);

    end    


end  