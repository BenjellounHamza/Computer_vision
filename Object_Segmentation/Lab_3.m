% K = 8;               % number of clusters used
% L = 30;              % number of iterations
% seed = 14;           % seed used for random initialization
% scale_factor = 1.0;  % image downscale factor
% image_sigma = 1.0;   % image preblurring scale

% I = imread('orange.jpg');
% I = imresize(I, scale_factor);
% Iback = I;
% d = 2*ceil(image_sigma*2) + 1;
% h = fspecial('gaussian', [d d], image_sigma);
% I = imfilter(I, h);

% tic
% [ segm, centers ] = kmeans_segm(I, K, L, seed);
% toc
% Inew = mean_segments(Iback, segm);
% I = overlay_bounds(Iback, segm);

% image_sigmas = [1, 3, 6];
% compteur = 1;
% for sigma = image_sigmas
%     I = imread('tiger1.jpg');
%     I = imresize(I, scale_factor);
%     Iback = I;
%     d = 2*ceil(sigma*2) + 1;
%     h = fspecial('gaussian', [d d], sigma);
%     I = imfilter(I, h);
%     [ segm, centers ] = kmeans_segm(I, K, L, seed);
%     Inew = mean_segments(Iback, segm);
%     subplot(3, 2, compteur)
%     imshow(Inew)
%     title("sigma = " + sigma)
%     compteur = compteur + 1;
%     I = overlay_bounds(Iback, segm);
%     subplot(3, 2, compteur)
%     imshow(I)
%     title("sigma = " + sigma)
%     compteur = compteur + 1;
% end

% scale_factor = 0.5;       % image downscale factor
% spatial_bandwidth = 10.0;  % spatial bandwidth
% colour_bandwidth = 5.0;   % colour bandwidth
% num_iterations = 40;      % number of mean-shift iterations
% image_sigma = 1.0;        % image preblurring scale


% first we change spatial bandwidth
% color_bandwidths = [3, 5, 10, 15];
% compteur = 1;
% for band = color_bandwidths
%   I = imread('tiger1.jpg');
%   I = imresize(I, scale_factor);
%   Iback = I;
%   d = 2*ceil(image_sigma*2) + 1;
%   h = fspecial('gaussian', [d d], image_sigma);
%   I = imfilter(I, h);
%  segm = mean_shift_segm(I, spatial_bandwidth, band, num_iterations);
%  Inew = mean_segments(Iback, segm);
%  I = overlay_bounds(Iback, segm);
%  figure()
%  subplot(1,2,1); imshow(Inew);
%  title("color bandwidth = " + band)
%  compteur = compteur + 1;
%  subplot(1,2,2); imshow(I); 
%  title("color bandwidth = " + band)
%  compteur = compteur + 1;
% end

% colour_bandwidth = 20.0; % color bandwidth
% radius = 3;              % maximum neighbourhood distance
% ncuts_thresh = 0.06;      % cutting threshold
% min_area = 250;          % minimum area of segment
% max_depth = 8;           % maximum splitting depth
% scale_factor = 0.4;      % image downscale factor
% image_sigma = 2.0;       % image preblurring scale
% 
% I = imread('tiger3.jpg');
% I = imresize(I, scale_factor);
% Iback = I;
% d = 2*ceil(image_sigma*2) + 1;
% h = fspecial('gaussian', [d d], image_sigma);
% I = imfilter(I, h);
% 
% segm = norm_cuts_segm(I, colour_bandwidth, radius, ncuts_thresh, min_area, max_depth);
% Inew = mean_segments(Iback, segm);
% I = overlay_bounds(Iback, segm);
% subplot(1,2, 1)
% imshow(Inew)
% title("min a = " + min_area + ", ncuts thr = " + ncuts_thresh)
% subplot(1,2, 2)
% imshow(I)
% title("min a = " + min_area + ", ncuts thr = " + ncuts_thresh)


