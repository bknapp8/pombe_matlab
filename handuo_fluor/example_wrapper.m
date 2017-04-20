contfile = ‘test_CONTOURS.mat'
load(contfile);
im = imread(’test.tif’, 2);

cont_dist = 5;

for j = 1 : length(frame(1).object)
        disp(['Working on cell No. ', num2str(j)]);
        obj = frame(1).object(j);
        if ~isempty(obj.Xcont)
            fluor_sig = contour_signal2(im, ...
                obj.Xcont, obj.Ycont, cont_dist, cont_dist, 2 * cont_dist);
            frame(1).object(j).fluor_sig = fluor_sig;
        end
end
    
clear im cont_dist;
save(contfile);
