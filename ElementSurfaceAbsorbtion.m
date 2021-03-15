function ESA = ElementSurfaceAbsorbtion(Vector, CavityGeometry)
%Function returns surface absorbtion coefficient of elements
 

%%


    function AC = Element1
      AC = 0;  
    end

    function AC = Element2
      AC = 1;    
    end

    function AC = Element3
        AC = 1;
    end

    function AC = Element4
        AC = 1;
    end

    function AC = Element5
        AC = 0;
    end

    function AC = Element6
        AC = 0;
    end

    function AC = Element7
        AC = 0;
    end

    function AC = Element8
    AC = 0;
    end

    function AC = Element9
    AC = 0;
    end

    function AC = Element10
        AC = 0;
    end

    function AC = Element11
      AC =0;
        
    end

    function AC = Element12
        AC = 0;
    
    end

    function AC = Element13
    end

    function AC = Element14
    end

    function AC = Element15
    end

    function AC = Element16
    end

    function AC = Element17
    end

    function AC = Element18
        AC = 1;
    end

%%
%Do not change here. Only add elements if needed

ESA = 1;
switch Vector.CurrentBody
    
    case 1
       ESA = Element1;
    case 2
       ESA = Element2;       
    case 3
       ESA = Element3;
    case 4
       ESA = Element4;
    case 5
       ESA = Element5;
    case 6
       ESA = Element6;       
    case 7
       ESA = Element7;
    case 8
       ESA = Element8;
    case 9
       ESA = Element9;       
    case 10
       ESA = Element10;
    case 11
       ESA = Element11;       
    case 12
       ESA = Element12;
    case 13
       ESA = Element13;
    case 14
       ESA = Element14;
    case 15
       ESA = Element15;       
    case 16
       ESA = Element16;
    case 17
       ESA = Element17;
    case 18
       ESA = Element18;        
       
end       

       
end

