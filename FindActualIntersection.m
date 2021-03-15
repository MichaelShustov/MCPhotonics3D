function ActualIntersectionStructure = FindActualIntersection(Vector,CavityGeometry)
%FindActualIntersection finds next closest intersection on the photon's way

%Input - Vector(structure) and CavityGeometry(array of array of
%ElementStructure)


%returns structure ActualIntersectionStructure:
%   .BodyNumber
%   .ElementNumber
%   .IntersectionPointXYZ
%   .Distance

%% Initialization
CurrentDistance = inf;                                                      
ActualIntersectionStructure.BodyNumber = -1;
ActualIntersectionStructure.ElementNumber = -1;
ActualIntersectionStructure.IntersectionPointXYZ = [0;0;0];
ActualIntersectionStructure.Distance = -1;

%% if the photon is in air (outside all elements)
if Vector.CurrentBody == 0                                                    
  
    for BodyNum = 1:1:size(CavityGeometry,2)                                %for all bodies in the cavity
  
        CurrentBodyGeometry = CavityGeometry(BodyNum).BodyGeometryArray;
       
        for ElementNum = 1:1:size(CurrentBodyGeometry,2)                    %for all elements of the body
           
            %ElementNum
            
            ElementGeometry = CavityGeometry(BodyNum).BodyGeometryArray(ElementNum);    %take new element
            
            %ElementGeometry.Normal
            %ElementGeometry.PointA
            %ElementGeometry.PointB
            %ElementGeometry.PointC
            
            ElementNormal = ElementGeometry.Normal;
            VectorDirection = Vector.DirectionVector;
            
            
            AngleVector2Normal = Line2LineAngle(VectorDirection,ElementNormal);
            
            if AngleVector2Normal > pi/2                                    %we are interested in elements directed to us
                
                IntersectionPoint = FindIntersectionPointVector2Element...
                    (Vector, ElementGeometry);
                
                                              
                
                if (CurrentDistance > IntersectionPoint.Distance) &&...     %conditions to take new intersection as actual
                        (IntersectionPoint.Distance >= 0) && ...
                        (Vector.CurrentElement ~= ElementNum) && ...
                        (Vector.CurrentBody ~= BodyNum)
                    
                    ActualIntersectionStructure.IntersectionPointXYZ = ...
                        IntersectionPoint.IntersectionPointXYZ;
                    ActualIntersectionStructure.Distance = ...
                        IntersectionPoint.Distance;
                    ActualIntersectionStructure.BodyNumber = BodyNum;
                    ActualIntersectionStructure.ElementNumber = ElementNum;
                    
                    CurrentDistance = IntersectionPoint.Distance;
                end
            end
        end
    end
    
    
%%     if we are inside the body    
else
    BodyNum = Vector.CurrentBody;
    CurrentBodyGeometry = CavityGeometry(BodyNum).BodyGeometryArray;
       
        for ElementNum = 1:1:size(CurrentBodyGeometry,2)                       %for all elements of the body
           
            ElementGeometry = CavityGeometry(BodyNum).BodyGeometryArray(ElementNum);
            
            ElementNormal = ElementGeometry.Normal;
            VectorDirection = Vector.DirectionVector;
            
            AngleVector2Normal = Line2LineAngle(VectorDirection,ElementNormal);
            
            if AngleVector2Normal < pi/2                                    %we are interested in elements directed from us
                
                IntersectionPoint = FindIntersectionPointVector2Element...
                    (Vector, ElementGeometry);
                
                
                
                %check if we found the same element (the element wehere we
                %are now or were on previous step
                SameElement = 0;
                if ((ElementNum == Vector.CurrentElement) && (BodyNum ==...
                        Vector.CurrentBody)) 
                    
                    SameElement = 1;
                end
                
                if (CurrentDistance > IntersectionPoint.Distance) &&...
                        (IntersectionPoint.Distance >= 0) && ...
                        (SameElement ~= 1)
                    
                    ActualIntersectionStructure.IntersectionPointXYZ = ...
                        IntersectionPoint.IntersectionPointXYZ;
                    ActualIntersectionStructure.Distance = ...
                        IntersectionPoint.Distance;
                    ActualIntersectionStructure.BodyNumber = BodyNum;
                    ActualIntersectionStructure.ElementNumber = ElementNum;
                    
                    CurrentDistance = IntersectionPoint.Distance;
                end
            end
        end
end                 
        

end

