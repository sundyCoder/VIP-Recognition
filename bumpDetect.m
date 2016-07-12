
function bumpDetect()
obj = VideoReader('../01-video/obnormalObj.mp4');
I = read(obj,1);
%nframes = obj.NumberofFrames;
trackedObj = zeros([size(I,1) size(I,2) 3], class(I));
background = zeros([size(I,1) size(I,2)]); % the background image

%% background image calculation 
for i = 1 : 1000
    currentframe = read(obj,i); % read the i-th frame from the video
    frame = rgb2gray(currentframe); % change the color image to grayscale image
    background = background + double(frame);
end
background = background/1000;

%% foreground object extraction
for i = 1 : 1000
    currentframe = read(obj,i); % read the i-th frame from the video
    frame = rgb2gray(currentframe); % change the color image to grayscale image
    foreground = double(frame) - background;
    foreground = uint8(foreground);
    imshow(foreground);
    drawnow;
    trackedObj(:,:,i) = foreground;
end
%implay(trackedObj,15);
%% save the result as another video file
vidObj = VideoWriter('foreground.avi');
open(vidObj);
for i = 1 : nframes
    writeVideo(vidObj,trackedObj(:,:,i));
end
close(vidObj);
