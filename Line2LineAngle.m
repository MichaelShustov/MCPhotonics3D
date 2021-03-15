function Gamma = Line2LineAngle(SingleVector1,SingleVector2)
%Line2LineAngle function calculates angle between 2 lines described
%with single vectors [x,y,z]

%%
%Scalar multiplication of vectors
scalarMult = dot(SingleVector1,SingleVector2);

%vectors lengths
Abs1 = sqrt(SingleVector1(1)^2 + SingleVector1(2)^2 +SingleVector1(3)^2);
Abs2 = sqrt(SingleVector2(1)^2 + SingleVector2(2)^2 +SingleVector2(3)^2);

%cos of angle between vectors
cosA = scalarMult/(Abs1*Abs2);

Gamma = acos(cosA);
end

