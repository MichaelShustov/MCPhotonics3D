% LS = load('Z:\#Natali\MCPhotonics3D\22_10_18\Model17\LongStory17.mat');
% LSS = LS.LongStory;
%  
LSS = LongStory;

Trap = 0;
PL = 0;

Detector3 = 0;
Detector4 = 0;

InitialWL = 808;

for i = 1:1:size(LSS,2)
   CurrentStory =  LSS{i};

   if strcmp(CurrentStory(length(CurrentStory)).Action,"SurfaceAbsorbtion") &&...
        (CurrentStory(length(CurrentStory)).Vector.CurrentBody == 3)   &&...
        (CurrentStory(length(CurrentStory)).Vector.WaveLength == 900 )
       Detector3 = Detector3 + 1 ;
   end
   
   if (CurrentStory(length(CurrentStory)).Action == "SurfaceAbsorbtion") &&...
        (CurrentStory(length(CurrentStory)).Vector.CurrentBody == 4)  &&...
        (CurrentStory(length(CurrentStory)).Vector.WaveLength == 900 )
       Detector4 = Detector4 + 1 ;
   end
  
   if (CurrentStory(length(CurrentStory)).Vector.WaveLength ~= InitialWL )   
       PL = PL + 1 ;
   end
    
   if (length(CurrentStory) == 50) && (CurrentStory(length(CurrentStory)).Vector.WaveLength ~= InitialWL ) Trap = Trap + 1;
   end
      
end
