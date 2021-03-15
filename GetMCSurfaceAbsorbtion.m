function MCSurfaceAbsorbtionBoolean = GetMCSurfaceAbsorbtion(Vector,CavityGeometry)
%GetMCSurfaceAbsorbtion returns 1, if the photon was absorbed on surface
%returns 0 if the photon NOT absorbed on the surface;


%%
MCSurfaceAbsorbtionBoolean = 0;

SAC = ElementSurfaceAbsorbtion(Vector, CavityGeometry);

rn = rand;

 if rn <= SAC MCSurfaceAbsorbtionBoolean =1;
 end


end

