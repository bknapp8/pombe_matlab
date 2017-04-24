function curcell = newcellwidth(curcell)

pos1 = [curcell.Xcont([1:end 1]),curcell.Ycont([1:end 1])];
perim1 = [0;cumsum((diff(pos1(:,1)).^2+diff(pos1(:,2)).^2).^.5)];
pos2 = [curcell.mesh(:,[1,2]);curcell.mesh(end-1:-1:1,[3,4])];
perim2 = [0;cumsum((diff(pos2(:,1)).^2+diff(pos2(:,2)).^2).^.5)];
centerline = [mean(curcell.mesh(:,[1,3]),2),mean(curcell.mesh(:,[2,4]),2)];

centerlinelength = [0;cumsum((diff(centerline(:,1)).^2+diff(centerline(:,2)).^2).^.5)];

dist2centerline = pdist2(pos2,centerline);
widths2 = min(dist2centerline,[],2);
medwidth = median(widths2);
pole1 = find(centerlinelength<(medwidth),1,'last');
pole2 = find(centerlinelength>(centerlinelength(end)-medwidth),1,'first');
centerlinedist = pdist2(pos2,centerline(pole1:pole2,:));
centerlinedist2 = pdist2(pos1(1:end-1,:),centerline(pole1:pole2,:));
widths2 = min(centerlinedist,[],2);

curcell.widths = spline(perim2,widths2,perim1(1:end-1));

curcell.poles = find(centerlinedist2(:,1)<1.5*medwidth | centerlinedist2(:,end)<1.5*medwidth);

% Add centerline to struct
curcell.centerline = centerline;
curcell.centerlinelength = centerlinelength(end);

end