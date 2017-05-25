These scripts will produce a centerline and generate cell geometries (width, length, surface area, volume) using the 'contour2pill_mesh' script from Morphometrics. 

To run the script, make sure all the necessary files are in the directory, and call the function: 

[W,L,SA,V] = morphometrics_calc_geom(x,y,stp,lng)

Parameters (all in pixels):
x,y = coordinates of cell contour
stp = step size for creating centerline (the best length here tends to be about 1/20 of x,y size)
lng = length for calculating 'rib' size. These ribs are the mesh grids that are produced by the Voronoi tessellation. Recommended here is a length about 5X estimated width.

When using the modified 'morphometrics_calc_geom', cells whose geometries are not able to be caclutated have empty geometry fields (i.e. width = [])
