function Res = GeometryPlot(Cavity)
%GeometryPlot builds a picture of the cavity

hold on

Res =1;

for Body = 1:1:length(Cavity)
for i = 1:1:size(Cavity(Body).BodyGeometryArray,2)
    BodyGeometry = Cavity(Body).BodyGeometryArray(i);
    X(1) = BodyGeometry.PointA(1);
    X(2) = BodyGeometry.PointB(1);
    X(3) = BodyGeometry.PointC(1);

        Y(1) = BodyGeometry.PointA(2);
    Y(2) = BodyGeometry.PointB(2);
    Y(3) = BodyGeometry.PointC(2);
    
        Z(1) = BodyGeometry.PointA(3);
    Z(2) = BodyGeometry.PointB(3);
    Z(3) = BodyGeometry.PointC(3);
    
    p = plot3(X,Y,Z);
    c = p.Color;
    p.Color = 'black';
end

end

end

