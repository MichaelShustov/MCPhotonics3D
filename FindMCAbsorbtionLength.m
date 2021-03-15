function MCAbsorbtionLength = FindMCAbsorbtionLength(Vector)
%FindMCAbsorbtionLength finds probable path before absorbtion

%obtain absorbtivity for a current body and current wavelength
k = ElementAbsorbtionFactor(Vector);  


RN = rand;   %generate random number

if k == 0    %if we obtained k=0, it is not correct. it must be very small, but non zero!
    k = 10^(-10);
end

MCAbsorbtionLength = -log10(RN)/k; %random length before ansorbtion of the photon

end

