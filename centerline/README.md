This set of scripts is for producing a centerline through a closed contour, given the (x,y) coordinates of a cell outline. Further analysis will produce geometrical properties (surface area, volume, length, and medial width)

To run, use function 'CENTERLINE_geom_props' using all of the dependencies in 'centerline/' folder.

USAGE: [S, V, L, W] = CENTERLINE_geom_props(x,y,stp)

PARAMETERS:

x,y = x/y coordinates

stp = step size for calculating centerline, in pixels (Recommended is using 1/20 of the total perimeter size)
