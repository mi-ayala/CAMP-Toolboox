function  Radii_2ndOrder(input)
%  ==================================================
%  Radii_2ndOrder
%  ==================================================
%  DESCRIPTION
%  __________________________________________________
%  INPUT
%  __________________________________________________
%  OUTPUT
%  __________________________________________________
%  MATLAB 9.11.0.1837725 (R2021b) Update 2
%  Miguel Ayala, 08-Feb-2022.
%  ==================================================

end 

function [rmin, rmax] = radii_2ndOrder(f,df,Z2, A, varargin)
% ================================================
%  RADII POLYNOMIAL 2ND ORDER
% ================================================
% Example
% ================================================
% radii_2ndOrder(f, df, df2, A, 'printResults', 'off')
% ================================================
% INPUT
% ================================================
% f ............... Function at approx. Interval.
% df .............. Derivative at approx. Interval.
% Z2 .............. Z2 Bound
% A ............... Derivative inverse approx.
% ================================================
% OPTIONAL INPUT
% ================================================
% printResults .... Followed by 'on' or 'off'
% ================================================
% OUTPUT
% ================================================
% rmin ............ Min  existence radius
% rmax ............ Max  existence radius
% ================================================
%  PRINTED OUTPUT
% ================================================
% 1. Y0 Bound
% 2. Z0 Bound
% 3. Z2 Bound
% 4. Existence interval size size
% ================================================
% February 2021, Miguel Ayala.
% ================================================ 

   %%% This part handles the inputs. I do this so I can suppress printed
   %%% output easily.
   default_printResults = 'on';
   expected_printResults = {'on','off'};

   p = inputParser;
   
   addRequired(p,'f');
   addRequired(p,'df');
   addRequired(p,'Z2');
   addRequired(p,'A');
   
   addParameter(p,'printResults',default_printResults,...
                 @(x) any(validatestring(x,expected_printResults)));
   
   parse(p,f, df, Z2 , A ,varargin{:});
   
   f = p.Results.f;
   df = p.Results.df;
   Z2 = p.Results.Z2;
   A = p.Results.A;
      
   if strcmp(p.Results.printResults,'on')
           printResults = 1;
   else
           printResults = 0;
   end

   
    %%% ***************************************
    %%% MATH STARTS HERE
    %%% ***************************************

    %%% Z0 Bound
    Z0 = sup(norm(eye(length(A(1,:))) - A*df, inf));
    
    %%% Z0 should be less than one. Otherwise, no radii polynomial has no positive roots
    if Z0 > 1
        fprintf([ '\n'...
                'radii_2ndOrder: Failed. Raddi polynomial has not positive roots.' ]) 
        return
    end
    
    Z0 = intval(Z0);
    
    %%% Z2. Second derivative
    Z2 = intval(Z2);
    
    %%% Y0
    Y0 = intval(sup(norm(A*f, inf)));
    
    %%% Checking for real roots
    if inf((1-Z0)^2 -4*Z2*Y0) < 0
        fprintf( ['\n'...
                'radii_2ndOrder: Failed. Raddi polynomial has possibly complex roots.'] )
        return
    end
    
    rmin= max(0, sup( (((1-Z0)- sqrt((1-Z0)^2 - 4*Z2*Y0))*(2*Z2)^-1) ));
    rmax= inf ((((1-Z0) +  sqrt((1-Z0)^2 - 4*Z2*Y0))*(2*Z2)^-1) );
    
    existenceInterval_size = abs(rmax-rmin);
    
    %%% ***************************************+
    %%% MATH ENDS HERE
    %%% ***************************************+

    %%%  Printing Results
     fprintf([ '\n'...
            'radii_2ndOrder: Successful validation.' ...
            '\n \n' ...         
            ]) 
     
     if printResults == 1
          fprintf([ 
            '                Y0 Bound = %i,\n' ...
            '                Z0 Bound =  %g, \n' ...
            '                Z2 Bound   =  %g, \n' ...
            '                Existence Interval size =  %g. \n' ...           
            ], [mid(Y0),mid(Z0),mid(Z2),existenceInterval_size]) 
     end    
     
end