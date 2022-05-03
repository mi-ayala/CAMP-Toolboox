function  SaveSolution(zfp_Name, RadiiOutput )
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
    filename = sprintf('%s _%s.mat', time, zfp_Name);
    save( filename, 'RadiiOutput' );
    
    end  