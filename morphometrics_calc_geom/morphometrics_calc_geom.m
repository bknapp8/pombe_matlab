function [W,L,SA,V] = morphometrics_calc_geom(x,y,stp,lng)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that uses a mix of scripts from Morphometrics. The first pass is
% a function 'contour2pill_mesh', which performs a medial axis
% transformation on a closed contour to find the longest neutral axis. The
% next step is to use Alex Colavind's script to obtain a cell length and
% median width. Then this uses Handuo Shi's scripts to obtain simple
% approximations of surface area and volume.

% NOTE: If 'contour2pill_mesh' doesn't work well, this function will not
% produce working results.

res = contour2pill_mesh([x y], stp, 0.01, lng);

curcell.mesh = res;
curcell.Xcont = x;
curcell.Ycont = y;

curcell = newcellwidth(curcell);

W = 2*median(curcell.widths);
L = curcell.centerlinelength;

SA = surface_area_from_mesh(curcell.mesh, curcell.centerline);
V = volume_from_mesh(curcell.mesh, curcell.centerline);





end


