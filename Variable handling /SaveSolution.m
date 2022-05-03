function  SaveSolution(zfp_Name, x, RadiiOutput )
%  ==================================================
%  SaveSolution
%  ==================================================
%  DESCRIPTION
%  Standarized way of saving validated solutions.
%  __________________________________________________
%  INPUT
%  __________________________________________________
%  OUTPUT
%  __________________________________________________
%  MATLAB 9.12.0.1884302 (R2022a)
%  Miguel Ayala, 02-May-2022.
%  ==================================================


time = datestr(now, 'yyyy_mm_dd');
filename = sprintf('%s_%s.mat', [zfp_Name,time]);
save( fullfile(filename), RaddiiOutput );

end  