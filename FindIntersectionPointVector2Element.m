function IntersectionPointStructure = FindIntersectionPointVector2Element(Vector, ElementStructure)
%IntersectionPoint finds intersection point between vector and surface element 

% If t<0 there is no intersection on the way of vector
% also if beta<0 or gamma<0 or beta+gamma >1 the point is out of triangle

% Function returns structure:
%   .Distance - distance to intersection point (if <0 - no matching
%                                                            intersection)
%   .IntersectionPointXYZ - array of coordinates of intersection point

ElementNormal = ElementStructure.Normal;
ElementA = ElementStructure.PointA;
ElementB = ElementStructure.PointB;
ElementC = ElementStructure.PointC;

VectorPos = Vector.CurrentPoint;
VectorDirection = Vector.DirectionVector;


                                               
%%
%System of equations to solve:
% T*(VectorPos+VectorDirection) + u*(ElementA - ElementB) + ...
%   v*(ElementA-ElementC) = ElementA - VectorPos

%Elements of matrix of left part of the system
a1 = VectorDirection(1);
a2 = ElementA(1) - ElementB(1);
a3 = ElementA(1) - ElementC(1);
a4 = VectorDirection(2);
a5 = ElementA(2) - ElementB(2);
a6 = ElementA(2) - ElementC(2);
a7 = VectorDirection(3);
a8 = ElementA(3) - ElementB(3);
a9 = ElementA(3) - ElementC(3);

%Elements of matrix of right part of the system
b1 = ElementA(1) - VectorPos(1);
b2 = ElementA(2) - VectorPos(2);
b3 = ElementA(3) - VectorPos(3);

A_matrix = [a1 a2 a3; a4 a5 a6; a7 a8 a9];

B_matrix = [b1 b2 b3].';

%solution of the system
warning('off')
Tuv_solve = linsolve(A_matrix,B_matrix);

T = Tuv_solve(1);
u = Tuv_solve(2);
v = Tuv_solve(3);

%%
% if T>=0, u>=0, v>=0, u<1, v<1, u+v<1 than intersection point is in the
% triangle and it is satisfying us
if (T >= 0) && (u >= 0) && (v >= 0) && (u <= 1) && (v <= 1) && ...
        (u+v <= 1)
    IntersectionPointStructure.IntersectionPointXYZ = VectorPos + VectorDirection.* T;
    IntersectionPointStructure.Distance = T * sqrt(VectorDirection(1)^2 + ...
        VectorDirection(2)^2 + VectorDirection(3)^2);
else IntersectionPointStructure.Distance = -1;
    IntersectionPointStructure.IntersectionPointXYZ = [0;0;0];

% if (abs(T) == inf) | (abs(v) == inf) | (abs(u) == inf)
%     T
%     u
%     v
%     Vector.CurrentPoint
%     Vector.DirectionVector
%     ElementNormal
% end



end

if size(T,1) > 1
'AHTUNG'
end
end

