function BoolResult = IsTotalInternalReflection(Vector,CavityGeometry,NOld,NNew)
%IsTotalInternalReflection - returns 1 if there is total internal
%reflection instead of refraction (check for total internal refraction)


oldDirectionVector = Vector.DirectionVector;
CurrentBody = Vector.CurrentBody;
CurrentElement = Vector.CurrentElement;
ElementStructure = CavityGeometry(CurrentBody).BodyGeometryArray(CurrentElement);
normVector = ElementStructure.Normal;

cosTeta1 = - dot(normVector,oldDirectionVector)/(VectorLength(normVector)*VectorLength(oldDirectionVector));
if (cosTeta1 < 0) | (cosTeta1 > 1)
    normVector = normVector * (-1);
    cosTeta1 = - dot(normVector,oldDirectionVector)/(VectorLength(normVector)*VectorLength(oldDirectionVector));
end

sinTeta1 = sqrt(1 - cosTeta1^2);

%%
%if total internal reflection
if (sinTeta1 * NOld / NNew) > 1
  BoolResult = 1;

else BoolResult = 0;

end

end

