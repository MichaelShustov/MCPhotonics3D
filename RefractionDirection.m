function NewDirection = RefractionDirection(Vector,CavityGeometry,NOld,NNew)
%RefractionTIReflection - returns new direction after refraction or total
%internal reflection from the polished surface

%%
oldDirectionVector = Vector.DirectionVector;
CurrentBody = Vector.CurrentBody;
CurrentElement = Vector.CurrentElement;
ElementStructure = CavityGeometry(CurrentBody).BodyGeometryArray(CurrentElement);
normVector = ElementStructure.Normal;

%normalization of vectors  
oldDirectionVector = oldDirectionVector*...
    (NOld/VectorLength(oldDirectionVector));  %length = NOld

normVector = normVector/VectorLength(normVector); %length = 1;

%Formula is taken in известия высших учебных заведений. геодезия и
%аэрофотосъемка, № 3, 2013. заКон преломления в веКторной форме
%г.а. можаров, а.а. панов
%NOTE! the next formula is valid only when |oldDirectionVector| = NOld
%- its length is equal to old index
%in this case length of new vector is equal to New index
NewDirection = oldDirectionVector + (sqrt((NNew^2 - NOld^2)/...
    ((dot(oldDirectionVector,normVector))^2) + 1) - 1)* ...
    (dot(oldDirectionVector,normVector)) * normVector;

   
end

