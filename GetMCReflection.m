function GetMCReflectionBoolean = GetMCReflection(Vector,CavityGeometry,NNew,NOld)
%GetMCReflection returns 1 if photon has to be reflected from surface


%%
GetMCReflectionBoolean = 0;
RC = ElementReflectionCoefficient(Vector, CavityGeometry,NNew,NOld);
rn = rand;

%if random number rn is less then reflection coefficient - reflection
if rn <= RC GetMCReflectionBoolean = 1;
end


end

