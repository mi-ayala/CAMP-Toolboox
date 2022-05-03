function  RetrieveSolution(zfp_Name, filemat)
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

load filemat

fprintf([ '\n'...
                        'RetrieveSolution:' ...
                        '\n \n' ...         
                        ]) 

[xInt, rmin, rmax, I]

fprintf([ 
                        '                Y Bound = %i,\n' ...
                        '                Z Bound =  %g, \n' ...
                        '                r_star   =  %g = 2^(-%i)% \n' ...
                        '                Existence Interval size =  %g. \n' ...           
                        ], [mid(Y),mid(Z),r_star, i, existenceInterval_size]) 





end  