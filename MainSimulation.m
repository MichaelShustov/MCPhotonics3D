DirectoryName = '\\132.68.20.73\excitonics\#Michael\MCPhotonics3D\Search for best angle Photon Extraction\';
EmissionSpectrumIntegral = load('EmissionSpectrumIntegral_cols_PumpWL.txt');
AbsorbtionSpectrumIntegral = load('AbsorptionSpectrum_vs_WL.txt');
SolarSpecIntegral = load('SolarSpectrumIntegral_upto1000nm.txt');


Cavity = LoadCavityGeometry(DirectoryName,2);

hold on;
GeometryPlot(Cavity);
axis([-60 60 -60 60 -60 60]);
axis equal;


clear LongStory
clear Story
warning('off')

MaxIterationsNumber = 5;

Photons = 10;

 InitialWL = 808;
tic
parfor i = 1:1:Photons
 
 Center = CenterPoint;
 Vector(i) = GenerateRandomPhotonInBeamSpot(InitialWL,Center, 0, 0.01, 1);
 Story = PhotonPropagation(Vector(i), Cavity, MaxIterationsNumber,EmissionSpectrumIntegral);

 
LongStory{i} = Story;  
% PhotonPathPlot(Story);
  
end
toc