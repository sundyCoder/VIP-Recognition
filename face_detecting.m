
function face_detecting()
clear all;close all;clc;
obj = VideoReader('../01-video/AirportVideo.m4v'); %read video file
nframes = obj.NumberOfFrames; %number of frames
faceDetector = vision.CascadeObjectDetector(); %create face detector

figure;
videoFrame = read(obj,6039);
p_bbox = step(faceDetector, videoFrame); %the previous bbox
for i = 828:4:882     
    videoFrame = read(obj,i);
    bbox = step(faceDetector, videoFrame);
    % filter faked targets
    rep_pbbox = repmat(p_bbox,[size(bbox,1),1]);
    diff = mean(abs(bbox - rep_pbbox),2);
    [~,minIndex] = min(diff);
    bbox = bbox(minIndex,:);
    p_bbox = bbox(1,:);
    
    % insert the tracking box into the frame
    videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
    imshow(videoFrame);
    
    %save the face images
    faceFrame = videoFrame(bbox(2):(bbox(2)+bbox(4)),bbox(1):(bbox(1)+bbox(3)));    
    jpgFileName = strcat('boss', num2str(i), '.jpg');
    imwrite(faceFrame,jpgFileName);
    %imshow(faceFrame);    
    %drawnow;
end

copyfile('boss828.jpg','../03-Demo/testSet/p1/p1.jpg')
copyfile('boss832.jpg','../03-Demo/testSet/p1/p2.jpg')
copyfile('boss836.jpg','../03-Demo/testSet/p1/p3.jpg')
copyfile('boss840.jpg','../03-Demo/testSet/p1/p4.jpg')
copyfile('boss844.jpg','../03-Demo/testSet/p1/p5.jpg')


% for i = 927:5:962
%     videoFrame = read(obj,i);
%     bbox = step(faceDetector, videoFrame);
%     % filter faked targets
%     rep_pbbox = repmat(p_bbox,[size(bbox,1),1]);
%     diff = mean(abs(bbox - rep_pbbox),2);
%     [~,minIndex] = min(diff);
%     bbox = bbox(minIndex,:);
%     p_bbox = bbox(1,:);
%     
%     % insert the tracking box into the frame
%     videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
%     imshow(videoFrame);
%     figure
%     faceFrame = videoFrame(bbox(2):(bbox(2)+bbox(4)),bbox(1):(bbox(1)+bbox(3)));
%     
%     jpgFileName = strcat('boss', num2str(i), '.jpg');
%     imwrite(faceFrame,jpgFileName);
%     imshow(faceFrame);    
%     drawnow;
% end

for i = 883:926
    videoFrame = read(obj,i);
    bbox = step(faceDetector, videoFrame);
    % filter faked targets
    rep_pbbox = repmat(p_bbox,[size(bbox,1),1]);
    diff = mean(abs(bbox - rep_pbbox),2);
    [~,minIndex] = min(diff);
    bbox = bbox(minIndex,:);
    p_bbox = bbox(1,:);
    
    % insert the tracking box into the frame
    videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
    imshow(videoFrame);
   % figure
    faceFrame = videoFrame(bbox(2):(bbox(2)+bbox(4)),bbox(1):(bbox(1)+bbox(3)));
    
    jpgFileName = strcat('guard', num2str(i), '.jpg');
    imwrite(faceFrame,jpgFileName);
    %imshow(faceFrame);    
    %drawnow;
end

copyfile('guard888.jpg','../03-Demo/testSet/p2/p1.jpg')
copyfile('guard890.jpg','../03-Demo/testSet/p2/p2.jpg')
copyfile('guard891.jpg','../03-Demo/testSet/p2/p3.jpg')
copyfile('guard892.jpg','../03-Demo/testSet/p2/p4.jpg')
copyfile('guard893.jpg','../03-Demo/testSet/p2/p5.jpg')

