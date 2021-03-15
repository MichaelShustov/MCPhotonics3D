function HistoryOfPhoton = PhotonPropagation(Vector, CavityGeometry, MaxIterations,IntegratedEmissionSpectrum)
%PhotonPropagation realizes state-machine for the photon. Contains 3 states
%- Volumetric action, Surface action and Stop (empty)



%%
Action.PreviousActionName = 'StartWork';
Action.Type = 'Volumetric';
Action.Number = 1;


HistoryOfPhoton(Action.Number).Vector = Vector;
HistoryOfPhoton(Action.Number).Action = Action.PreviousActionName;


while (strcmp(Action.Type,'Stop') ~= 1) && (Action.Number < MaxIterations)
    Action.Number = Action.Number + 1;
    
    switch Action.Type 
        
        %chose volumetric actions
        case 'Volumetric'   %calculating volumetric properties
            ActionResult = VolumetricAction(Vector,CavityGeometry,IntegratedEmissionSpectrum);
       
            
        %chose surface actions
        case  'Surface' 
            ActionResult = SurfaceAction(Vector,CavityGeometry);
            
        %stop
        case 'Stop'
            %!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
    end

% State change
Action.Type = ActionResult.NextActionType;
Action.PreviousActionName = ActionResult.ActionName;
Vector = ActionResult.Vector;    

%Saving result of action
HistoryOfPhoton(Action.Number).Vector = ActionResult.Vector;
HistoryOfPhoton(Action.Number).Action = ActionResult.ActionName;   


end        


end

