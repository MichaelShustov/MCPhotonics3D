function CavityGeometry = LoadCavityGeometry(DirectoryName,NumberOfFiles)
%LoadCavityGeometry loads all files with geometry

%Files have to be named like '1.stl', '2.stl'.....

%returns struct array CavityGeometry of ElementStructure array
%CavityGeometry index - body number



%%
for i=1:1:NumberOfFiles
    filename = strcat(num2str(i),'.stl');
    
    
    BodyGeometryArray = ParseGeometryFile(DirectoryName,filename);
    
    CavityGeometry(i).BodyGeometryArray = BodyGeometryArray;
   
    
end


end

