function img = correctRaster(img, rasterPhase, fillFraction)
% raster correction for resonant scanners.  
% rasterPhase is the phase different between left-right and right-left scan
% lines. 
%
% img size [x y nSlices nFrames].   2D and 3D images also work


sz = [size(img,1) size(img,2) size(img,3) size(img,4)];
ix = (-sz(2)/2+0.5:sz(2)/2-0.5)/(sz(2)/2);
tx = asin(ix*fillFraction);  % convert index to time
for iSlice = 1:size(img,3)
    for iFrame = 1:size(img, 4)
        im = img(:,:,iSlice,iFrame);
        extrapVal = mean(im(:));
        img(1:2:end,:,iSlice,iFrame) = interp1(ix, im(1:2:end,:)', ...
            sin(tx'+rasterPhase)/fillFraction,'linear',extrapVal)';
        img(2:2:end,:,iSlice,iFrame) = interp1(ix, im(2:2:end,:)', ...
            sin(tx'-rasterPhase)/fillFraction,'linear',extrapVal)';
    end
end
end
