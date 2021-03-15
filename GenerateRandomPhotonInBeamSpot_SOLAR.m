function Vector = GenerateRandomPhotonInBeamSpot_SOLAR(SolarSpecIntegral, CenterPoint, SpotDiameter, SpotAngleDeg)
%GenerateRandomPhoton generates a random photon (Vector) in a beam


SpotAngle = SpotAngleDeg * pi /180;

Phi = rand * 2 * pi; %polar angle in the entrance plane
R = rand * SpotDiameter / 2; %radius in the entrance plane

Gamma = rand * 2 * pi; %polar angle in the cone
Teta = rand * SpotAngle;

FirstPoint = CenterPoint + [R*cos(Phi);0;R*sin(Phi)];

if tan(Teta) ~= 0
DirectionNotNorm = [R*cos(Gamma);R/tan(Teta);R*sin(Gamma)];
else 
DirectionNotNorm = [0;-1;0];
end

DirectionNorm = DirectionNotNorm/VectorLength(DirectionNotNorm);

Vector.CurrentPoint = FirstPoint;
Vector.DirectionVector = DirectionNorm;
Vector.CurrentBody = 0;
Vector.CurrentElement = 0;
Vector.PreviousBody = 0;
Vector.PreviousElement =0;

%% Solar spectrum generation
R = rand;
WL = 300;
for i = 300:1:size(SolarSpecIntegral,1)
    if R >= SolarSpecIntegral(i) WL = i;
    end
end

Vector.WaveLength = WL;

end

