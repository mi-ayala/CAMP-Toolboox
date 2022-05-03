function [xInt, rmin, rmax, I] = Radii_1stOrder(f,x,A, varargin)
% ================================================
%  RADII POLYNOMIAL 1ST ORDER
% ================================================
% Example
% ================================================
% radii_1stOrder(f, df, df2, A, 'printResults', 'off')
% ================================================
% INPUT
% ================================================
% f ............... Function and derivative,[F,dF] 
% x ............... Aproximated solution
% A ............... Derivative inverse approx.
% ================================================
% OPTIONAL INPUT
% ================================================
% printResults .... Followed by 'on' or 'off'
% ================================================
% OUTPUT
% ================================================
% xInt ............ Interval solution
% rmin ............ Min  existence radius
% rmax ............ Max  existence radius
% I ............... 0 for Success, 1 for fail
% ================================================
%  PRINTED OUTPUT
% ================================================
% 1. Y Bound
% 2. Z Bound
% 3. r*
% 4. Existence interval size 
% ================================================
% January 2022, Miguel Ayala.
% ================================================ 
  
   %%% This part handles the inputs. I do this so I can suppress printed
   %%% output easily.
   default_printResults = 'on';
   expected_printResults = {'on','off'};

   p = inputParser;
   
   addRequired(p,'f');
   addRequired(p,'x');
   addRequired(p,'A');
   
   addParameter(p,'printResults',default_printResults,...
                 @(x) any(validatestring(x,expected_printResults)));
   
   parse(p,f, x, A,varargin{:});
   
   f = p.Results.f;
   x = p.Results.x;
   A = p.Results.A;
      
   if strcmp(p.Results.printResults,'on')
           printResults = 1;
   else
           printResults = 0;
   end
   
    %%% ***************************************
    %%% MATH STARTS HERE
    %%% ***************************************
    
    fprintf([ '\n'...
    'Radii_1stOrder: \n'...
    '               Running validation...\n' ...        
    ]) 

    [f_int,df_int] = f(intval(x));

    for i = 18:52
        
        
        r_star = 1/(2^i);
        x_ball = midrad(x, r_star);
        [f_ball, df_ball] = f(x_ball);
        
        %%% Z bound, should be less than one.
        Z = sup(norm(eye(length(A(1,:))) - intval(A)*df_ball,inf));
        
        if Z < 1
            
            %%% Bound Y0
            Y = sup(norm(A*f_int,inf));
            
            Y = intval(Y);
            Z = intval(Z);
            
            if sup(-Y/(Z-1) - intval(r_star) ) < 0
                
                 rmin= -Y/(Z-1);
                 rmax= r_star;     
                 
                existenceInterval_size = sup(rmax-rmin);
                xInt = midrad(x, sup((1/2)*(rmax-rmin)) );
                
                 I = 0; 
                 
                 if printResults == 1

                      fprintf([ '\n'...
                      '               Successful validation with:' ...
                      '\n ' ...         
                      ]) 

                      fprintf([ 
                        '                 Y Bound = %i,\n' ...
                        '                  Z Bound =  %g, \n' ...
                        '                  r_star   =  %g = 2^-%i, \n' ...
                        '                  Existence Interval size =  %g. \n' ...           
                        ], [mid(Y),mid(Z),r_star, i, existenceInterval_size]) 
                 end                    
                                 
                return
            end

        end

        for j = 1:5

            if i == 10*j
                fprintf([ ...
                      '                  r_star has to be less than 2^-%i.'          
                ],[i]) 
            end    

             
        end
        
        if i==52

                 I = 1;
                 rmin = 0;
                 rmax = 0; 
                 xInt = [];

                 fprintf([ '\n'...
                        '               It was not possible to find a r_star.'          
                        ])              
        end
        
    end
       
end
