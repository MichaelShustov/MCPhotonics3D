function IsMCPL = FindMCPL(Vector)
%FindMCPL - finds probability for PL


QE = ElementQuantumYield(Vector); %getting quantum efficiency

%get the random number and compare to quantum efficiency
r = rand; 
if (r < QE) & (Vector.WaveLength < 1000)
    IsMCPL = 1;
else IsMCPL = 0;
end


end

