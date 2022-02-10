function  Norm = l1_norm(a, nu, varargin)
%  ==================================================
%  l1_norm
%  ==================================================
%  DESCRIPTION 
%  Computes {l^1}^n geometric-weighted norm.
%  If a is matrix, it computes the norm by columns.
%  varargin should be the indeces
%  __________________________________________________
%  INPUT
%  a .. sequence
%  nu .. weight
%  varargin ..  1 for one-sided seq.
%              -1 for two sided seq.
%  __________________________________________________
%  OUTPUT
%  Norm ..  l1 geometric-weighted norm of a
%  __________________________________________________
%  MATLAB 9.11.0.1837725 (R2021b) Update 2
%  Miguel Ayala, 08-Feb-2022.
%  ==================================================

    %%% Number of modes
    N = length(a(:,1))-1;

    %%% Geometric weight

    if isempty(varargin)
        index = 0:N;
    else
        %N = (N-1)/2;
        %index = -N:N;
        index = varargin;
    end          

    exponent = repmat(index', 1, length(a(1,:)) );
    w = nu*ones(size(a));

    %%% Building output  
    Norm = sum( abs(a).* (w.^exponent) , 1);


end  