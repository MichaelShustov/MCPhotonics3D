function EAF = ElementAbsorbtionFactor(Vector)
%ElementAbsorbtionFactor 

%User defined functions - properties of the cavity
 

%%
%Chengeable part of the function
%%Absorbtivity for different elements (by their number) are
%defined here
    function AF = Element0 %this is always for air!!!!
       AF = 0;
    end

    
    function AF = Element1  %sample
   
    %this part is only needed when we check surfaces for photon extraction
    if Vector.WaveLength == 808 AF = 0.921;
 %   elseif Vector.WaveLength == 900 AF = 0.064;
    else AF = 0.00000000000001;
    end
    
    
    end
    
    
    function AF = Element2 
    AF = 1000;
    end

    function AF = Element3
    AF = 1000000000000;
    end

    function AF = Element4
    AF = 1000000000000;
    end

    function AF = Element5
    AF = 0.0000001;
    end

    function AF = Element6
    AF = 0.0000001;
    end

    function AF = Element7
    AF = 0.0000001;
    end

    function AF = Element8
    AF = 1;
    end

    function AF = Element9
    
    AF = 0.0000001;
    end

      function AF = Element10
        AF = 0.0000001;
      end

      function AF = Element11
        AF = 0;
      end

     function AF = Element12
        AF = 0;
    end

      function AF = Element13
   end

     function AF = Element14
   end

     function AF = Element15
   end

     function AF = Element16
   end

     function AF = Element17
   end

    function AF = Element18
    AF = 0;
    end


%%

%%Main state machine

EAF = 0;
ElementType = Vector.CurrentBody;

switch ElementType
    
    case 0
        EAF = Element0;
    
    case 1
        EAF = Element1;

     case 2
        EAF = Element2;
     
     case 3
        EAF = Element3;
    
    case 4
        EAF = Element4;
     
    case 5
        EAF = Element5;
     
    case 6
        EAF = Element6;
     
    case 7
        EAF = Element7;
     
    case 8
        EAF = Element8;
     
    case 9
        EAF = Element9;
     
    case 10
        EAF = Element10;
     
    case 11
        EAF = Element11;
     
    case 12
        EAF = Element12;
     
    case 13
        EAF = Element13;
     
    case 14
        EAF = Element14;
     
    case 15
        EAF = Element15;        
     
    case 16
        EAF = Element16;
     
    case 17
        EAF = Element17;        
     
    case 18
        EAF = Element18;        
end       
        
end

