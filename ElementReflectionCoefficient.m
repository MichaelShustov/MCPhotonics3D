function ReflectionCoeff = ElementReflectionCoefficient(Vector, CavityGeometry,NNew,NOld)
%ElementReflectionCoefficient returns reflection coefficient for the exact
%body


%%
%Changeable part of the function
%Reflection coefficients for different elements (by their number) are
%defined here

    function RC = Element1
        
        Element = CavityGeometry(Vector.CurrentBody).BodyGeometryArray(Vector.CurrentElement);
        RC = AverageFrenelReflectionCoefficient(Vector, Element, NOld, NNew);
     
    end

    function RC = Element2
        
        Element = CavityGeometry(Vector.CurrentBody).BodyGeometryArray(Vector.CurrentElement);
        RC = AverageFrenelReflectionCoefficient(Vector, Element, NOld, NNew);
    end

    function RC = Element3
        RC = 0;
    end

    function RC = Element4
        RC = 0;
    end

    function RC = Element5
        Element = CavityGeometry(Vector.CurrentBody).BodyGeometryArray(Vector.CurrentElement);
        RC = AverageFrenelReflectionCoefficient(Vector, Element, NOld, NNew);
    end

    function RC = Element6
        Element = CavityGeometry(Vector.CurrentBody).BodyGeometryArray(Vector.CurrentElement);
        RC = AverageFrenelReflectionCoefficient(Vector, Element, NOld, NNew);
    end

    function RC = Element7
        Element = CavityGeometry(Vector.CurrentBody).BodyGeometryArray(Vector.CurrentElement);
        RC = AverageFrenelReflectionCoefficient(Vector, Element, NOld, NNew);
    end

    function RC = Element8
        RC = 1;
    end

    function RC = Element9
        Element = CavityGeometry(Vector.CurrentBody).BodyGeometryArray(Vector.CurrentElement);
        RC = AverageFrenelReflectionCoefficient(Vector, Element, NOld, NNew);
    end

    function RC = Element10
       Element = CavityGeometry(Vector.CurrentBody).BodyGeometryArray(Vector.CurrentElement);
       RC = AverageFrenelReflectionCoefficient(Vector, Element, NOld, NNew);
    end

    function RC = Element11

    end

    function RC = Element12
       
    end

    function RC = Element13
    end

    function RC = Element14
    end

    function RC = Element15
    end

    function RC = Element16
    end

    function RC = Element17
    end

    function RC = Element18
     RC =0;
    end

%%
%Do not change here. Only add elements if needed

ReflectionCoeff = 1;         %default value

switch Vector.CurrentBody
    
    case 1
       ReflectionCoeff = Element1;
    case 2
       ReflectionCoeff = Element2;       
    case 3
       ReflectionCoeff = Element3;
    case 4
       ReflectionCoeff = Element4;
    case 5
       ReflectionCoeff = Element5;
    case 6
       ReflectionCoeff = Element6;       
    case 7
       ReflectionCoeff = Element7;
    case 8
       ReflectionCoeff = Element8;
    case 9
       ReflectionCoeff = Element9;       
    case 10
       ReflectionCoeff = Element10;
    case 11
       ReflectionCoeff = Element11;
    case 12
       ReflectionCoeff = Element12;       
    case 13
       ReflectionCoeff = Element13;
    case 14
       ReflectionCoeff = Element14;
    case 15
       ReflectionCoeff = Element15;
    case 16
       ReflectionCoeff = Element16;       
    case 17
       ReflectionCoeff = Element17;
    case 18
       ReflectionCoeff = Element18;
    case 19
       ReflectionCoeff = Element19;       
  
       
end       

       
end

