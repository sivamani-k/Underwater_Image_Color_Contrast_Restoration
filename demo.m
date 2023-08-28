clc;clear;close all
warning('off','all')
I= imread('D:\Backup\Underwater Imaging\1. Journal paper final\1. Testimages\Greenish\5.jpg');
img = im2double(I);
figure;imshow(img);
title('input image');
[size1,size2,hv]=size(img);
tt=fix(min(size1,size2)/2-1);
tic;
[dehazed_img, comp_time, trans_map, x] = fcn_multi(img);
toc;
figure;imshow(dehazed_img);
title('Enhancement result');
I2 = imresize(dehazed_img,[480 480]); 
%imwrite(I2,'D:\1. Final\1. final\1. Final Outputs\DarkChannel\Turbid\new\6.jpg') ;
%result=title('Dark Channel');
%diary('MFCB.txt');
% imwrite(trans_map1,'C:\Users\Administrator\Desktop\picture\hc(trans_map1).bmp')
figure;
imagesc(trans_map); 
title('transmission map');
