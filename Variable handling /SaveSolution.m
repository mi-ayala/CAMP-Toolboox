function  SaveSolution(zfp_Name, xInt, rmin, rmax, I )
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
    
    %time = datestr(now, 'yyyy_mm_dd');
    filename = sprintf('%s.mat',  zfp_Name);
    save( filename, 'xInt', 'rmin', 'rmax', 'I', 'zfp_Name' );

    fprintf([ '\n'...
                        'SavedSolution: Saved!' ...
                        '\n' ...         
                        ]) 
    
    end  