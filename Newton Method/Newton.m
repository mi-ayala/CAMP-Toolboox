function [x, ite, increment,residual] = Newton(f, xInput, varargin)
% ================================================
%  NEWTON'S METHOD
%   Stopping test: Residual < 1e-15 
%   Norm: Infinity norm 
% ================================================
% Example
% ================================================
% newton(f, xInput, maxIte, 'printResults', 'off')
% ================================================
% INPUT
% ================================================
% f ............... Function and derivative,[F,dF] 
% xInput .......... Initial guess
% ================================================
% OPTIONAL INPUT
% ================================================
% maxIte .......... Maximum number of iterations
% printResults .... Followed by 'on' or 'off'
% ================================================
% OUTPUT
% ================================================
% x ............... Approximate solution
% iter ............ Number of iterations
% increment ....... Increment's size
% residual ........ Residual's size
% ================================================
%  PRINTED OUTPUT
% ================================================
% 1. Iterations
% 2. Linear and quadratic ratios
% 3. Increment's size
% 4. Residual's size
% 5. One over the condition number of the derivative at final iteration
% ================================================
% January 2021, Miguel Ayala.
% ================================================

   %%% This part handles the inputs. I do this so I can suppress printed
   %%% output easily (useful when looking for solutions).
   default_maxIter = 1;
   default_printResults = 'on';
   expected_printResults = {'on','off'};

   p = inputParser;
   
   addRequired(p,'f');
   addRequired(p,'xInput');
   
   addOptional(p,'maxIter',default_maxIter);
   addParameter(p,'printResults',default_printResults,...
                 @(x) any(validatestring(x,expected_printResults)));
   
   parse(p,f, xInput,varargin{:});
   
   f = p.Results.f;
   xInput = p.Results.xInput;
   maxIter =  p.Results.maxIter;
      
   if strcmp(p.Results.printResults,'on')
           printResults = 1;
   else
           printResults = 0;
   end
   

    %%% ***************************************+
    %%% MATH STARTS HERE
    %%% ***************************************+
    
    %%% Stops until increment < epsilon
    epsilon = 1e-13;

    %%% Variables
    x = reshape(xInput,[],1);
    [fx,dfx] = f(x);
    incrementNorm = 1;
    residual = 1;
    r1 = 1;
    r2 = 1;

    residual_0 = norm(fx,inf) ;
    initial_condition_number = cond(dfx)^(-1);
    
    for ite = 1:maxIter 

        oldIncrementNorm = incrementNorm;

        %%%  Testing invertibility of derivative and finding increment
        conditionNum =  cond(dfx)^(-1);

        if (conditionNum > 10^(-12)) 

            increment = dfx\fx;
            incrementNorm = norm(increment,inf);

        else
            %%% Convergence rates
            r1 = incrementNorm/oldIncrementNorm ;   
            r2 = incrementNorm/oldIncrementNorm.^2;
            %x = reshape(x,1,[]);

            if printResults == 1
                fprintf([ '\n'...
                'Newton: Derivative is singular.' ...
                '\n' ...
                '        Starting residual size =  %g, \n' ...
                '        derivative starting condition number =  %g, \n' ...
                '        iterations = %i,\n' ...
                '        linear rate =  %g, \n' ...
                '        quadratic rate =  %g, \n' ...
                '        increment size =  %g, \n' ...
                '        final residual size =  %g, \n' ...
                '        derivative final condition number =  %g. \n' ...            
                ], [residual_0,initial_condition_number,ite, r1,r2,incrementNorm,residual,conditionNum])  
            end

            return
        end

        %%% Updating variables
        x = x - increment;
        [fx,dfx] = f(x);
        residual = norm(fx,inf);

        %%% Print data after each iteration
        %fprintf('newton:%i,  residual =  %.10e,\n' ,[ite,residual])

        %%% Stopping test
        if residual < epsilon

            %%% Convergence rates
            r1 = incrementNorm/oldIncrementNorm ;   
            r2 = incrementNorm/oldIncrementNorm.^2;
            %x = reshape(x,1,[]);

            if printResults == 1
                fprintf([ '\n'...
                    'Newton: Residual is less than %g. ' ...
                    '\n' ...
                    '        Starting residual size =  %g, \n' ...
                    '        derivative starting condition number =  %g, \n' ...
                    '        iterations = %i,\n' ...
                    '        linear rate =  %g, \n' ...
                    '        quadratic rate =  %g, \n' ...
                    '        increment size =  %g, \n' ...
                    '        final residual size =  %g, \n' ...
                    '        derivative condition number =  %g. \n' ...
                    '\n'
                    ], [epsilon, initial_condition_number, residual_0, ite, r1,r2,incrementNorm,residual,conditionNum])    
            end

            return
        end    

    
    end

    %%% Convergence rates
    r1 = incrementNorm/oldIncrementNorm ;   
    r2 = incrementNorm/oldIncrementNorm.^2;
    %x = reshape(x,1,[]);

    if printResults == 1
        fprintf([ '\n'...
            'Newton: Reached maximum number of iterations.' ...
            '\n' ...
            '        Starting residual size =  %g, \n' ...
            '        derivative starting condition number =  %g, \n' ...
            '        iterations = %i,\n' ...
            '        linear rate =  %g, \n' ...
            '        quadratic rate =  %g, \n' ...
            '        increment size =  %g, \n' ...
            '        final residual size =  %g, \n' ...
            '        derivative condition number =  %g. \n' ...
            ], [residual_0, initial_condition_number, ite, r1,r2,incrementNorm,residual,conditionNum])  
    end

end

 
