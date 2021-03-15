function R = AverageFrenelReflectionCoefficient(Vector, Element, NOld, NNew);
%AverageFrenelReflectionCoefficient returns reflection coefficient of the
%transparent body surface, calculated for average polarization of the
%photon (0.5*Rs + 0.5Rp)



cosTeta1 = dot(Vector.DirectionVector, Element.Normal)/...
    (VectorLength(Vector.DirectionVector)*VectorLength(Element.Normal));

cosTeta1 = abs(cosTeta1);

sinTeta1 = sqrt(1 - cosTeta1^2);

if cosTeta1 == 1   %normal incidence case
    R = ((NNew - NOld)/(NNew + NOld))^2;

elseif (NOld * sinTeta1/NNew) > 1  %case of total internal reflection
    R = 1;
    
else   %all other cases
    sinTeta2 = NOld * sinTeta1/NNew;
    cosTeta2 = sqrt (1 - sinTeta2);
    
    Rs = ((NOld * cosTeta1 - NNew * cosTeta2)/...
        (NOld * cosTeta1 + NNew * cosTeta2))^2;
    Rp = ((NOld * cosTeta2 - NNew * cosTeta1)/...
        (NOld * cosTeta2 + NNew * cosTeta1))^2;

    R = 0.5 * (Rs + Rp);  %for non-polarized waves
end

end

