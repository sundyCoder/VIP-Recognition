
clear all;close all;clc;
face_detecting();
getTrainingData();
getTestData();

load('TRN_X.mat');
load('TRN_Y.mat');
load('TST_X1.mat');
load('TST_X2.mat');

vip = [1;1;1;1;1];
TST_X = [TST_X1;TST_X2];

% for i = 1:2
    prediction = multisvm(TRN_X,TRN_Y,TST_X1);
    if vip==prediction
        display('VIP(P1) is coming!');
    else
        display('P1 not Vip!');
    end
    
    prediction = multisvm(TRN_X,TRN_Y,TST_X2);
    if vip==prediction
        display('VIP is coming!');
        imshow('testSet/vip/VIP00001.jpg');
        figure;
    else
        display('P2 not Vip!');
    end
% end


