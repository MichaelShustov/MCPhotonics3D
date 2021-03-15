function Res = PhotonPathPlot(HistoryOfPhoton)
%PhotonPathPlot plots photon historic path

%%
for i=1:1:size(HistoryOfPhoton,2)
    X(i) = HistoryOfPhoton(i).Vector.CurrentPoint(1);
    Y(i) = HistoryOfPhoton(i).Vector.CurrentPoint(2);
    Z(i) = HistoryOfPhoton(i).Vector.CurrentPoint(3);
end
plot3(X,Y,Z);

end

