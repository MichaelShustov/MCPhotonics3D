function NewVector = MoveVectorOnDistance(Vector,Distance)
%MoveVectorOnDistance moves the photon (Vector.CurrentPoint) 
%to the given Distance on its direction


%%
Direction = Vector.DirectionVector;
DirectionLength = sqrt(Direction(1)^2 + Direction(2)^2 + Direction(3)^2);
SingleDirectionVector = Direction / DirectionLength;

NewVector = Vector;
NewVector.CurrentPoint = Vector.CurrentPoint + SingleDirectionVector*Distance;


end

