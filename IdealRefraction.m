function RefractionResults = IdealRefraction(Vector, CavityGeometry)
%IdealRefraction - creates a photon after refraction on the polished 
%surface


NewVector = Vector;

%%
%First we need to understand, where we go next - to air, or to another
%body.

NextVirtualIntersection = FindActualIntersection(Vector,CavityGeometry);

%if We were in the body
if (Vector.PreviousBody ~=0) 
    
    %next body - air
    if (NextVirtualIntersection.Distance > 0) | ...
            (NextVirtualIntersection.Distance == -1)
    
         NextRefractionCoefficient = 1;
         PreviousRefractionCoefficient = ElementRefractionCoefficient(Vector,Vector.CurrentBody);
         
         %in case of total internal reflection
         if IsTotalInternalReflection...
                 (Vector,CavityGeometry,PreviousRefractionCoefficient,NextRefractionCoefficient) == 1
             NewVector = SpecularReflection(Vector,CavityGeometry);
             Res = 'TotalInternalReflection';
                     
         %if no total internal reflection
         else NewVector.DirectionVector = ...
                 RefractionDirection(Vector,CavityGeometry,PreviousRefractionCoefficient,NextRefractionCoefficient);
             NewVector.CurrentBody = 0;
             NewVector.CurrentElement = 0;
             NewVector.PreviousBody = Vector.CurrentBody;
             NewVector.PreviousElement = Vector.CurrentElement;
             Res = 'Refraction';
         end
    
    %next body - not air (another body)
    else
        
         NextRefractionCoefficient = ...
             ElementRefractionCoefficient(Vector,NextVirtualIntersection.BodyNumber);
         PreviousRefractionCoefficient = ElementRefractionCoefficient(Vector,Vector.CurrentBody);
    
         %in case of total internal reflection
         if IsTotalInternalReflection...
                 (Vector,CavityGeometry,PreviousRefractionCoefficient,NextRefractionCoefficient) == 1
             NewVector = SpecularReflection(Vector,CavityGeometry);
             Res = 'TotalInternalReflection';
         
         %if no total internal reflection
         else NewVector.DirectionVector = ...
                 RefractionDirection(Vector,CavityGeometry,PreviousRefractionCoefficient,NextRefractionCoefficient);
              Res = 'Refraction';
         end
    
     end

    
%we are in "free" air    
elseif (Vector.PreviousBody == 0)
    
         NextRefractionCoefficient = ...
             ElementRefractionCoefficient(Vector,Vector.CurrentBody);
         PreviousRefractionCoefficient = 1;
    
        
         NewVector.DirectionVector = ...
                 RefractionDirection(Vector,CavityGeometry,PreviousRefractionCoefficient,NextRefractionCoefficient);
        Res = 'Refraction';
end
    
RefractionResults.NewVector = NewVector;
RefractionResults.Result = Res;
RefractionResults.NNew = NextRefractionCoefficient;
RefractionResults.NOld = PreviousRefractionCoefficient;

NN = CavityGeometry(Vector.CurrentBody).BodyGeometryArray(Vector.CurrentElement).Normal;
VD = Vector.DirectionVector;
IncomingAngle = Line2LineAngle(NN,VD);
end

