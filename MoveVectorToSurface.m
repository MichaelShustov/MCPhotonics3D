function NewVector = MoveVectorToSurface(Vector,NextIntersection)
%MoveVectorToSurface - moves the photon to the point of intersection on a
%surface

%%
NewVector = Vector;
NewVector.CurrentPoint = NextIntersection.IntersectionPointXYZ;
NewVector.CurrentBody = NextIntersection.BodyNumber;
NewVector.CurrentElement = NextIntersection.ElementNumber;
NewVector.PreviousBody = Vector.CurrentBody;
NewVector.PreviousElement =Vector.CurrentElement;





end

