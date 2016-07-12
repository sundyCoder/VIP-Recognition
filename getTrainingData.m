
function getTrainingData()
%get traning data
clear all;
clc;
%listImages = dir('*.jpg');

mat1 = imread('trainingSet/1.jpg');
mat1 = im2double(mat1);
mat1 = imresize(mat1,[34,34],'bicubic');  %resize the image to 34x34
mat1 = reshape(mat1,1,1156);

mat2 = imread('trainingSet/2.jpg');
mat2 = im2double(mat2);
mat2 = imresize(mat2,[34,34],'bicubic'); %resize the image to 34x34
mat2 = reshape(mat2,1,1156);
M1 = [mat1;mat2];

for i = 3:20    
    jpgName = strcat('trainingSet/', num2str(i), '.jpg');       
    matFileName = imread(jpgName);   
    matFileName = im2double(matFileName);
    matFileName = imresize(matFileName,[34,34],'bicubic') %resize the image to 34x34
    matFile = reshape(matFileName,1,1156);
    M1 = [M1;matFile];    %save all the images in Matrix M    
end
% save TR1 M1;
TRN_Y1([1:20],1)=1;
% save TRN_Y1;


% clear all;
% clc;
mat1 = imread('trainingSet/21.jpg');
mat1 = im2double(mat1);
mat1 = imresize(mat1,[34,34],'bicubic');  %resize the image to 34x34
mat1 = reshape(mat1,1,1156);

mat2 = imread('trainingSet/22.jpg');
mat2 = im2double(mat2);
mat2 = imresize(mat2,[34,34],'bicubic'); %resize the image to 34x34
mat2 = reshape(mat2,1,1156);
M2 = [mat1;mat2];

for i = 23:40    
    jpgName = strcat('trainingSet/', num2str(i), '.jpg');       
    matFileName = imread(jpgName);   
    matFileName = im2double(matFileName);
    matFileName = imresize(matFileName,[34,34],'bicubic') %resize the image to 34x34
    matFile = reshape(matFileName,1,1156);
    M2 = [M2;matFile];    %save all the images in Matrix M    
end
% save TR2 M2;
TRN_Y2([1:20],1)=2;
% save TRN_Y2;


% clear all;
% clc;
mat1 = imread('trainingSet/41.jpg');
mat1 = im2double(mat1);
mat1 = imresize(mat1,[34,34],'bicubic');  %resize the image to 34x34
mat1 = reshape(mat1,1,1156);

mat2 = imread('trainingSet/42.jpg');
mat2 = im2double(mat2);
mat2 = imresize(mat2,[34,34],'bicubic'); %resize the image to 34x34
mat2 = reshape(mat2,1,1156);
M3 = [mat1;mat2];

for i = 43:60 
    jpgName = strcat('trainingSet/', num2str(i), '.jpg');       
    matFileName = imread(jpgName);  
    matFileName = imresize(matFileName,[34,34],'bicubic') %resize the image to 34x34
    matFileName = im2double(matFileName);    
    matFile = reshape(matFileName,1,1156);
    M3 = [M3;matFile];    %save all the images in Matrix M    
end
% save TR3 M3;
TRN_Y3([1:20],1)=3;
% save TRN_Y3;

%Get TRN_X
TRN_X=[M1;M2;M3];

%Get TRN_X
TRN_Y=[TRN_Y1;TRN_Y2;TRN_Y3];

save TRN_X;
save TRN_Y;
