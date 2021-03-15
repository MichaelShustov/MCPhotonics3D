%%To generate photon beam with angular dispersion it has to checked!!!

function Vector = GenerateRandomPhotonInBeamSpot(WL, CenterPoint, SpotDiameter, SpotAngleDeg, CurrentBody)
%GenerateRandomPhoton generates a random photon (Vector) in a beam

SpotAngle = SpotAngleDeg * pi /180;

Phi = rand * 2 * pi; %polar angle in the entrance plane
R = rand * SpotDiameter / 2; %radius in the entrance plane

Gamma = rand * 2 * pi; %polar angle in the cone
Teta = rand * SpotAngle;

%FirstPoint = CenterPoint + [R*cos(Phi);0;R*sin(Phi)];
FirstPoint = CenterPoint;

if tan(Teta) ~= 0
%DirectionNotNorm = [R*cos(Gamma);-R/tan(Teta);R*sin(Gamma)];
DirectionNotNorm = [0;0.9999;0];
else 
DirectionNotNorm = [0;0.9999;0];
end

DirectionNorm = DirectionNotNorm/VectorLength(DirectionNotNorm);

Vector.CurrentPoint = FirstPoint;
Vector.DirectionVector = DirectionNorm;
Vector.CurrentBody = CurrentBody;
Vector.CurrentElement = 0;
Vector.PreviousBody = 0;
Vector.PreviousElement =0;
Vector.WaveLength = WL;

end

