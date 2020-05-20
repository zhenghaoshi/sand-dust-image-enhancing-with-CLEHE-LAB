function imDust_clahe_demo()

%this is a demo for the publication of "Zhenghao Shi,Yaning Feng , Minghua
%Zhao, Erhu Zhang, Lifeng He, Normalized Gamma Transformation Based Contrast Limited Adaptive Histogram Equalization with Color Correction for Sand-Dust Image Enhancement. IET Image Processing. 14(4):747 -756, 2020"
clc 
clear all; 
close all;

folderTest  = fullfile('O-dusthazy'); %%% test dataset
folderResult= fullfile('experiment2'); %%% result

%%% read images
ext         =  {'*.jpg','*.png','*.bmp'};
filePaths   =  [];
for i = 1 : length(ext)
    filePaths = cat(1,filePaths, dir(fullfile(folderTest,ext{i})));
end

tic
for i = 1:length(filePaths)
    
%%% read current image
%[filename,filepath]=uigetfile('*.*',' ‰»Î“ª ∏ˆÕºœÒ'); 
%img_nm=strcat(filepath,filename);
img_nm=fullfile(folderTest,filePaths(i).name);
[~,nameCur,extCur] = fileparts(filePaths(i).name);
img =imread(img_nm);
 img =imresize(img,[400 600]);   
   imgDst=imhisteq_Lab(img);   

figure(9), imshow(imgDst); title('Final enhanced image');
% save the result
im_ext  =  '.jpg';
%imNM_dustRemoved=[folderResult filesep  filename '_nosied'  im_ext];
imNM_dustRemoved=[folderResult filesep  nameCur '_CLAHe_lab'    im_ext];
imwrite(imgDst,imNM_dustRemoved);
end
time_cost=toc/length(filePaths)
end
