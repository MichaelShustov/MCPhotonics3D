function ActionResult = VolumetricAction(Vector,CavityGeometry,IntegratedEmissionSpectrum)
%VolumetricAction realizes volumetric actions - photon fly out, scattering,
%absorbtion, PL, moving to next surface


%% calculate volumetric properties
        NextIntersection = FindActualIntersection(Vector,CavityGeometry);
        
        AbsorbtionLength = FindMCAbsorbtionLength(Vector);
        ScatteringLength = FindMCScatteringLength(Vector);
        IsPL = FindMCPL(Vector);
        
        
%% Choose the next action
        
        %photon goes outside the cavity
        if NextIntersection.BodyNumber == -1 
            Action.Name =  'Fly out';
            Action.NextType = 'Stop';
            Distance = 100;                                                   %tEMP VALUE
            NewVector = MoveVectorOnDistance(Vector,Distance);
            
          
            
        %photon was absorbed without PL
        elseif (NextIntersection.Distance > AbsorbtionLength) &&...
                (IsPL == 0) && (AbsorbtionLength < ScatteringLength)
           Action.Name = 'Absorbtion';
           Action.NextType = 'Stop';
           NewVector = MoveVectorOnDistance(Vector,AbsorbtionLength);
          
        %photon was absorbed and after emitted a new one
        elseif (NextIntersection.Distance > AbsorbtionLength) &&...
                (IsPL == 1) && (AbsorbtionLength < ScatteringLength)
            Action.Name = 'PL';
            Action.NextType = 'Volumetric';
            NewVector1 = MoveVectorOnDistance(Vector,AbsorbtionLength);
            
            NewVector = PL(NewVector1,IntegratedEmissionSpectrum);
          
        %photon was scattered
        elseif (NextIntersection.Distance > ScatteringLength) &&...
               (AbsorbtionLength < ScatteringLength)
            Action.Name = 'Scattering';
            Action.NextType = 'Volumetric';
            NewVector = Scattering(Vector,ScatteringLength);
          
        
        %photon moves to the next border without changes
        else Action.Name = 'Move2NextPoint';
             Action.NextType = 'Surface';
             NewVector = MoveVectorToSurface(Vector,NextIntersection);
             
        end
        %end of volumetric actions

        
        %returning results
        ActionResult.Vector = NewVector;
        ActionResult.ActionName = Action.Name;
        ActionResult.PreviousActionType = 'Volumetric';
        ActionResult.NextActionType = Action.NextType;

        
        
end

