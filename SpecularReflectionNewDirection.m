function newDirectionVector = SpecularReflectionNewDirection (Vector, ElementStructure) 
%SpecularReflection returns a new photon vector reflected from the surface

%%
oldDirectionVector = Vector.DirectionVector;
normVector = ElementStructure.Normal/norm(ElementStructure.Normal);


%Formula is taken in известия высших учебных заведений. геодезия и
%аэрофотосъемка, № 3, 2013. заКон преломления в веКторной форме
%г.а. можаров, а.а. панов
%NOTE! the next formula is valid only when |oldDirectionVector| = n
%- its length is equal to index
%in this case length of new vector is equal to old vector
newDirectionVector = oldDirectionVector - 2* dot(oldDirectionVector,...
   normVector)* normVector;

end

