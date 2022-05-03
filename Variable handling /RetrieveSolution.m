function   [xInt, x, rmin, rmax, I] = RetrieveSolution(filemat)
%  ==================================================
%  RetrieveSolution
%  ==================================================
%  DESCRIPTION
%  Retrieves the information of a validated solution
%  saved using SaveSolution.m 
%  __________________________________________________
%  INPUT
%  __________________________________________________
%  OUTPUT
%  __________________________________________________
%  MATLAB 9.12.0.1884302 (R2022a)
%  Miguel Ayala, 02-May-2022.
%  ==================================================
filemat;
loadedVars = load(filemat);

fprintf([ '\n'...
                        'RetrieveSolution:' ...
                        '\n' ...         
                        ]) 

if loadedVars.I == 0                      
    fprintf([ '\n' ... 
   '                Validated interval solution of %s(x)=0.\n' ...
   ], [loadedVars.zfp_Name]) 
else
    fprintf([ '\n' ... 
   '                Interval approximation of %s.\n' ...
   ], [loadedVars.zfp_Name]) 
end 

% fprintf([ 
%             '                Solution details:\n'...
%             '                rmin =  %g, \n' ...
%             '                rmax   = %g . \n' ...
%             ], [ loadedVars.rmin, loadedVars.rmax] ) 


 
   xInt = loadedVars.xInt;
   x  = loadedVars.x;
   rmin =loadedVars.rmin;
   rmax =loadedVars.rmax;
   I =loadedVars.I;


end  