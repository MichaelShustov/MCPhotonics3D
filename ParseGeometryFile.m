function BodyGeometryArray = ParseGeometryFile(DirectoryName,ShortFilename)
%ParseGeometryFile - parsing of *.stl file
%Function loads geometry of the details into a big array
% output array - array of struct - ElementStructure
% Element structure:
%    Normal - array of size 3
%    PointA - .....
%    PointB
%    PointC


%%
JumpChars = 16;
Filename = strcat(DirectoryName,ShortFilename);

fileID = fopen(Filename,'r');

FileHeader = fgets(fileID);                                                   %reading file header, we actually don't need it
ElementHeader = string(fgets(fileID,JumpChars));
ElementNumber = 0;



Stop = 0;

while ElementHeader == '   facet normal '
    ElementNumber = ElementNumber + 1;
    ElementNormal = fscanf(fileID, '%f %f %f',[3 1]);
    fgets(fileID);
    fgets(fileID);
    fgets(fileID,JumpChars);
    ElementA = fscanf(fileID, '%f %f %f',[3 1]);
    fgets(fileID);
    fgets(fileID,JumpChars);
    ElementB = fscanf(fileID, '%f %f %f',[3 1]);
    fgets(fileID);
    fgets(fileID,JumpChars);
    ElementC = fscanf(fileID, '%f %f %f',[3 1]);
    fgets(fileID);
    fgets(fileID);
    fgets(fileID);
    
    ElementHeader = string(fgets(fileID,JumpChars));
    
    ElementStructure.Normal = ElementNormal;
    ElementStructure.PointA = ElementA;
    ElementStructure.PointB = ElementB;
    ElementStructure.PointC = ElementC;
    
    BodyGeometryArray(ElementNumber) = ElementStructure;
end

fclose(fileID);
end

