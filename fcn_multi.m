function [out_img, time, trans_map, A] = fcn_multi(img)
%The main function of multi-band enhancement.

%   Input arguments:
%   ----------------
%	- img : input haze image, type "double"
%	- scale_smooth : predifined smoothing factors (epsilon)
%	- scale_mapping : parameters for mapping function (optional)
%   - box_size: size of default box for filtering
%
%   Output arguments:
%   ----------------
%   - out_img: output dehazed image
%   - trans_map: transmission map
%   - A: ampbient light
%


addpath('msrcr_block/')
scale_smooth = [1e-4, 1e-3, 1e-2]; 
% scale_mapping = {[0.5, 20], [0.8, 20], [0.8, 10]};
scale_mapping = {[0.5, 40], [0.8, 40], [0.8, 10]};
box_size =30;

[size1,size2,~]=size(img);
if (mod(size1,box_size)<=8)
    size1=fix(size1/box_size)*box_size;
    img=imcrop(img,[0,0,size2,size1]);
elseif(mod(size2,box_size)<=8)
    size2=fix(size2/box_size)*box_size;
    img=imcrop(img,[0,0,size2,size1]);
end
tic;
% [img,msrcr_img]=msrcr_block(img,box_size);
[out_img, trans_map, A] = fcn_multiscale_enhancement(img, img, box_size, scale_smooth, scale_mapping);
adj_percent = [0.005, 0.995];
out_img = imadjust(out_img, adj_percent);

time = toc;

