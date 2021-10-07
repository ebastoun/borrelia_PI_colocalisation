
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Colocalisation index calculation with manual threshold setting
% By Annalena Reuss
% PhD student, University of Tuebingen
% E-mail : annalena.reuss@uni-tuebingen.de
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
% specify the paths to the PI and the GFP channels of the image at a certain time point
% make sure to use the same time point for both the PI and the GFP image

piImgPath = './exampleData/red uncalibrated aggregate assay_A2_4_00d04h30m.tif';
gfpImgPath = './exampleData/gfp uncalibrated aggregate assay_A2_4_00d04h30m.tif';


%--------------------------------------------------------------------------
% bg subtraction, segment/binarize the PI image 
piImg = double(imread(piImgPath));
piImgBg = imtophat(piImg, strel('disk', 40));
piImgSeg = mat2gray(piImgBg);

% remove the comments on the lines below to diplay the histogram for the PI
% image and determine a proper threshold for binarization

%figure;
%imhist(piImgSeg);title("PI");


piThresh = 0.075; % set desired threshold for the PI image here
piImgSeg = imbinarize(piImgSeg,piThresh);


%--------------------------------------------------------------------------
% bg subtraction, segment/binarize the GFP image 
gfpImg = double(imread(gfpImgPath));
gfpImgBg = imtophat(gfpImg, strel('disk', 40));
gfpImgSeg = mat2gray(gfpImgBg);

% remove the comments on the lines below to diplay the histogram for the
% GFP image and determine a proper threshold for binarization

%figure;
%imhist(gfpImgSeg);title("GFP");


gfpThresh = 0.036; % set desired threshold for the GFP image here
gfpImgSeg = imbinarize(gfpImgSeg,gfpThresh); 

% additional improvement of the GFP image
%gfpImgSeg = imclose(gfpImgSeg, strel('disk', 1));
%gfpImgSeg = imerode(gfpImgSeg, strel('disk', 1));


%--------------------------------------------------------------------------
% determine pixel overlap of the PI and GFP image
overlap = (piImgSeg) .* (gfpImgSeg);

% display segmented channels and overlap
figure(1);
imagesc(piImgSeg); axis image; colorbar; colormap gray; title("PI segmented");

figure(2);
imagesc(gfpImgSeg); axis image; colorbar; colormap gray; title("GFP segmented");

figure(3);
imagesc(overlap); axis image; colorbar; colormap gray; title("Overlap");


%--------------------------------------------------------------------------
% calculate colocalisation index
colocIndex = sum(sum(overlap))/sum(sum(gfpImgSeg))*100; % times 100 to get percentage value
disp(strcat("Overlap area: ", num2str(sum(sum(overlap))))); % show overlap
disp(strcat("Coloc Index: ", num2str(colocIndex))); % show colocalisation index
