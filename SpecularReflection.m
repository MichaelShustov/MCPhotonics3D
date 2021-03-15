function NewVector = SpecularReflection(Vector,CavityGeometry)
%SpecularReflection - creates reflected vector

%%
CurrentBody = Vector.CurrentBody;
CurrentElement = Vector.CurrentElement;
ElementStructure = CavityGeometry(CurrentBody).BodyGeometryArray(CurrentElement);
            
NewVectorDirection = SpecularReflectionNewDirection(Vector, ElementStructure);
NewVector = Vector;
NewVector.DirectionVector = NewVectorDirection;
NewVector.CurrentBody = Vector.PreviousBody;


end

