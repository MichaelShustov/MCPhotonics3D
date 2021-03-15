function NewVector = PL(Vector, IntegratedEmissionSpectrum)
%PL generates a new photon after PL. 

%random direction in sphere. method taken from http://mathworld.wolfram.com/SpherePointPicking.html
Teta = rand * 2 * pi ;
U = rand * 2 - 1;

XT = sqrt(1 - U^2) * cos(Teta);
YT = sqrt(1 - U^2) * sin(Teta);
ZT = U;

DirectionNotNorm = [XT;YT;ZT];

DirectionNorm = DirectionNotNorm * ElementRefractionCoefficient(Vector,Vector.CurrentBody)...
   / VectorLength(DirectionNotNorm);


NewVector = Vector;
NewVector.DirectionVector = DirectionNorm;

%% Find new wave length
% RNDNum = rand;
% 
% PumpWL = round(Vector.WaveLength);
% NewWL = PumpWL;
% SZ = 1199;
% 
% if PumpWL<1100
%     for i = PumpWL:1:SZ
%      if RNDNum >= IntegratedEmissionSpectrum(i,PumpWL)
%         NewWL = i;
%      end
%     end
% else NewWL = 2000;    
% end
% 


 %AHTUNG!!! THIS is a temporal thing!!!!!!!!!!!!!!!!!!
if Vector.WaveLength == 808 NewWL = 900;
elseif Vector.WaveLength == 900 NewWL = 1050;
else NewWL = 1050;
end
   

NewVector.WaveLength = NewWL;


%%

NewVector.CurrentBody = Vector.CurrentBody;
NewVector.CurrentElement = 0;
NewVector.PreviousBody = Vector.CurrentBody;
NewVector.PreviousElement = Vector.CurrentElement;


end

