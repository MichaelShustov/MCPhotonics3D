function ActionResult = SurfaceAction(Vector,CavityGeometry)
%SurfaceAction makes surface actions - reflection, refraction, surface
%absorbtion



%% Calculate refraction parameters to define reflection coefficients and other properties
    RRes = IdealRefraction(Vector, CavityGeometry);
    
    NNew = RRes.NNew;
    NOld = RRes.NOld;
    ResText = RRes.Result;
    NewVector = RRes.NewVector;


%% calculate surface properties
        IsSurfaceAbsorbtion = GetMCSurfaceAbsorbtion(Vector,CavityGeometry);
        IsReflection = GetMCReflection(Vector,CavityGeometry,NNew,NOld);

        
        
%% Chose the surface action     
        
        %Specular reflection
        if IsReflection == 1 
            Action.Name = 'Reflection';
            Action.NextType = 'Volumetric';
            NewVector = SpecularReflection(Vector,CavityGeometry);
            
        
        %Absorbtion on the surface    
        elseif IsSurfaceAbsorbtion == 1 
            Action.Name = 'SurfaceAbsorbtion';
            Action.NextType = 'Stop';
            NewVector = Vector;
            
        %Refraction
        else
            Action.Name = 'Refraction';
            Action.NextType = 'Volumetric';
            
        end
        
        
              
        %returning results
        ActionResult.Vector = NewVector;
        ActionResult.ActionName = Action.Name;
        ActionResult.PreviousActionType = 'Volumetric';
        ActionResult.NextActionType = Action.NextType;

end

