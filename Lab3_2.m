%% Read an image containing a barcode into the workspace
file = "img5.png";
I = imread(file);
I = imsharpen(I);
imshow(I);
roi1 = drawrectangle;
pos1 = roi1.Position;
roi2 = drawrectangle;
pos2 = roi2.Position;
roi3 = drawrectangle;
pos3 = roi3.Position;
roi4 = drawrectangle;
pos4 = roi4.Position;
disp(pos1)
disp(pos2) 
disp(pos3)
disp(pos4)
roi = [pos1
    pos2
    pos3
    pos4];
imSize = size(I);
for i = 1:size(roi,1)
    [msg, format, locs] = readBarcode(I, roi(i,:), '1D');
    disp("Message: " + msg + "; Format: " + format);
    xyBegin = locs(1,:);
    I = insertShape(I, "line", [1 xyBegin(2) imSize(2) xyBegin(2)], "LineWidth", 5);
    I = insertText(I, xyBegin, msg, "BoxOpacity", 1, "FontSize", 20);
end
imshow(I)
filename = file + "_scan.jpg";
imwrite(I, filename); 
