The function 'loadtiff' will simply load a tiff stack (single channel) as NxMxF 3D array, where NXM is the image size, and F is the frame/slice number. 

To show an image, you can load 'imagesc(:,:,i)' for the ith frame.
