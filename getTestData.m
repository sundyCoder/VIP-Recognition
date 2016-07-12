
function output = getTestData()
%get Testing data
clear all;close all;clc ;
listImages = dir('testSet/p1/*.jpg');

mat1 = imread('testSet/p1/p1.jpg');
mat1 = im2double(mat1);
mat1 = imresize(mat1,[34,34],'bicubic');  %resize the image to 34x34
mat1 = reshape(mat1,1,1156);

mat2 = imread('testSet/p1/p2.jpg');
mat2 = imresize(mat2,[34,34],'bicubic'); %resize the image to 34x34
mat2 = im2double(mat2);
mat2 = reshape(mat2,1,1156);
TST_X1 = [mat1;mat2];

for i = 3:length(listImages)    
    jpgName = strcat('testSet/p1/p', num2str(i), '.jpg');       
    matFileName = imread(jpgName);  
    matFileName = imresize(matFileName,[34,34],'bicubic') %resize the image to 34x34
    matFileName = im2double(matFileName);
    matFile = reshape(matFileName,1,1156);
    TST_X1 = [TST_X1;matFile];    %save all the images in Matrix M    
end
save TST_X1;

TST_Y1([1:20],1)=1;
save TST_Y1;



%get Testing data
clear all;close all;clc ;
listImages = dir('testSet/p2/*.jpg');

mat1 = imread('testSet/p2/p1.jpg');
mat1 = im2double(mat1);
mat1 = imresize(mat1,[34,34],'bicubic');  %resize the image to 34x34
mat1 = reshape(mat1,1,1156);

mat2 = imread('testSet/p2/p2.jpg');
mat2 = imresize(mat2,[34,34],'bicubic'); %resize the image to 34x34
mat2 = im2double(mat2);
mat2 = reshape(mat2,1,1156);
TST_X2 = [mat1;mat2];

for i = 3:length(listImages)    
    jpgName = strcat('testSet/p2/p', num2str(i), '.jpg');       
    matFileName = imread(jpgName);  
    matFileName = imresize(matFileName,[34,34],'bicubic') %resize the image to 34x34
    matFileName = im2double(matFileName);
    matFile = reshape(matFileName,1,1156);
    TST_X2 = [TST_X2;matFile];    %save all the images in Matrix M    
end
save TST_X2;

TST_Y2([1:20],1)=1;
save TST_Y2;

