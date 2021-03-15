function ERC= ElementRefractionCoefficient(Vector,BodyNumber)
%ElementRefractionCoefficient 
 

%%
%Chengeable part of the function
%Refraction coefficient for different elements (by the number) are defined
%here
    function RC = Element0
        RC = 1;
    end

    
    function RC = Element1  %quartz glass

         RC = 1.83;
    end

    function RC = Element2
    RC = 1.83;
    end

    function RC = Element3
    RC = 1;
    end

    function RC = Element4
    RC = 1;
    end

    function RC = Element5
    RC = 1.49;
    end

    function RC = Element6
    RC = 1.46;
    end

    function RC = Element7
    RC = 1.46;
    end

    function RC = Element8
    RC = 1;
    end

    function RC = Element9
    RC = 1.49;
    end

     function RC = Element10
     RC = 1.49;   
      end

      function RC = Element11

   RC = 1.83;
      end

     function RC = Element12
  RC = 1;
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
        RC = 1;
    end

%%
%Do not change here. Only add elements if needed

ERC = 1;

switch BodyNumber
    
    case 0
        ERC = Element0;
    
    case 1
        ERC = Element1;
     case 2
        ERC = Element2;
     case 3
        ERC = Element3;
     case 4
        ERC = Element4;
     case 5
        ERC = Element5;
     case 6
        ERC = Element6;
     case 7
        ERC = Element7;
     case 8
        ERC = Element8;
     case 9
        ERC = Element9;
     case 10
        ERC = Element10;
     case 11
        ERC = Element11;
     case 12
        ERC = Element12;
     case 13
        ERC = Element13;
     case 14
        ERC = Element14;
     case 15
        ERC = Element15;        
     case 16
        ERC = Element16;
     case 17
        ERC = Element17;        
     case 18
        ERC = Element18;        
end       
        
end

