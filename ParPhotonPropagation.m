function Result = ParPhotonPropagation(Vector, CavityGeometry, MaxIterations)

%%OLD FUNCTION - has to be deleted!!!

%ParPhotonPropagation runs PhotonPropagation in Parallel computing and
%presents results as cell-array




%%
TempResult = PhotonPropagation(Vector, CavityGeometry, MaxIterations);

for j = 1:1:length(TempResult)
   CurrPoint = TempResult(j).Vector.CurrentPoint;
   Direction = TempResult(j).Vector.DirectionVector;
   WL = TempResult(j).Vector.WaveLength; 
   Action = TempResult(j).Action;
   
   Result{1,j} = CurrPoint(1);
   Result{2,j} = CurrPoint(2);
   Result{3,j} = CurrPoint(3);
   Result{4,j} = Direction(1);
   Result{5,j} = Direction(2);
   Result{6,j} = Direction(3);
   Result{7,j} = WL;
   Result{8,j} = Action;
   
   
   
   
   
end


end

