%question 1
% tools = few256;
% 
% %first kernel: Sobel operator
% deltax_1 = [-1 0 1; -2 0 2; -1 0 1];
% deltay_1 = [-1 -2 -1; 0 0 0; 1 2 1];
% 
% %second kernel: central difference
% deltax_2 = [0 0 0; -1/2 0 1/2; 0 0 0];
% deltay_2 = [0 -1/2 0; 0 0 0; 0 1/2 0];
% 
% %third kernel: forward difference
% deltax_3 = [0 0 0; 0 -1 1; 0 0 0];
% deltay_3 = [0 0 0; 0 -1 0; 0 1 0];
% 
% %fourth kernel: Robert's operator
% deltax_4 = [1 0; 0 -1];
% deltay_4 = [0 1; -1 0];
% 
% subplot(2, 4, 1);
% showgrey(conv2(tools, deltax_1, 'valid'));
% title('dxtools Sobel');
% subplot(2, 4, 2);
% showgrey(conv2(tools, deltax_2, 'valid'));
% title('dxtools central');
% subplot(2, 4, 3);
% showgrey(conv2(tools, deltax_3, 'valid'));
% title('dxtools forward');
% subplot(2, 4, 4);
% showgrey(conv2(tools, deltax_4, 'valid'));
% title('dxtools Robert');
% subplot(2, 4, 5);
% showgrey(conv2(tools, deltay_1, 'valid'));
% title('dytools Sobel');
% subplot(2, 4, 6);
% showgrey(conv2(tools, deltay_2, 'valid'));
% title('dytools central');
% subplot(2, 4, 7);
% showgrey(conv2(tools, deltay_3, 'valid'));
% title('dytools forward');
% subplot(2, 4, 8);
% showgrey(conv2(tools, deltay_4, 'valid'));
% title('dytools Robert');

%question2:

%dxtoolsconv = conv2(tools, deltax_2, 'valid');
%dytoolsconv = conv2(tools, deltay_2, 'valid');
%gradmagntools = sqrt(dxtoolsconv .^2 + dytoolsconv .^2);
%figure();
%subplot(2, 4, 1);
%histogram(gradmagntools)
%subplot(2, 4, 5);
%showgrey((gradmagntools -5) > 0)
%title("threshold = 5")
%subplot(2, 4, 6);
%showgrey((gradmagntools -10) > 0)
%title("threshold = 10")
%subplot(2, 4, 7);
%showgrey((gradmagntools -15) > 0)
%title("threshold = 15")
%subplot(2, 4, 8);
%showgrey((gradmagntools -20) > 0)
%title("threshold = 20")
%subplot(2, 4, 9);
%showgrey((gradmagntools -25) > 0)

%smoothing before applying derivation:

% figure();
% pic = godthem256;
% thresholds = [10 15 20 25];
% unsmoothed = Lv(pic, 'valid');
% subplot(2, 5, 1);
% showgrey(unsmoothed);
% title('original');
% smoothed = Lv(gaussfft(pic, 1));
% subplot(2, 5, 6);
% showgrey(smoothed);
% title('smoothed');
% for i=1:length(thresholds)
%     subplot(2, 5, 1+i);
%     showgrey((unsmoothed - thresholds(i)) > 0);
%     title(sprintf('thre = %.f', thresholds(i)));
%     subplot(2, 5, 5 + 1 + i);
%     showgrey((smoothed - thresholds(i)) > 0);
%     title(sprintf('thre = %.f', thresholds(i)));
%end

%Question 4:

% %define all masks
% dxmask = [0 0 0 0 0; 0 0 0 0 0; 0 -1/2 0 1/2 0; 0 0 0 0 0; 0 0 0 0 0];
% dymask = dxmask';
% 
% dxxmask = [0 0 0 0 0; 0 0 0 0 0; 0 1 -2 1 0; 0 0 0 0 0; 0 0 0 0 0];
% dyymask = dxxmask';
% dxymask = conv2(dxmask, dyymask, 'same');
% 
% dxxxmask = conv2(dxmask, dxxmask, 'same');
% dyyymask = conv2(dymask, dyymask, 'same');
% dxxymask = conv2(dxxmask, dymask, 'same');
% dyyxmask = conv2(dyymask, dxmask, 'same');
% 
% %test masks
% 
% [x ,y] = meshgrid(-5:5, -5:5);
% filtred = filter2(dxxymask,  x .^3 .* y, 'valid');
% showgrey(filtred);

% house = godthem256;
% scales = [0.0001 1 4 16 64];
% for i=1:5
%     subplot(2, 3, i);
%     contour(Lvvtilde(discgaussfft(house,scales(i)), 'same'), [0 0]);
%     title(sprintf('scale = %f', scales(i)));
%     axis('image')
%     axis('ij')
% end

% tools = few256;
% showgrey((Lvvvtilde(discgaussfft(tools,10), 'same')) < 0);
% 
% scales = [0.0001 1 4 16 64];
% for i=1:5
%     subplot(2, 3, i);
%     showgrey((Lvvvtilde(discgaussfft(tools,scales(i)), 'same')) < 0);
%     title(sprintf('scale = %f', scales(i)));
%     axis('image')
%     axis('ij')
% end

% Question 5:

% tools = godthem256;
% scales = [4 16 64];
% for i=1:3
%     subplot(2, 3, 3 + i);
%     showgrey((Lvvvtilde(discgaussfft(tools,scales(i)), 'same')) < 0);
%     subplot(2, 3, i);
%     contour(Lvvtilde(discgaussfft(tools,scales(i)), 'same'), [0 0]);
%     title(sprintf('scale = %f', scales(i)));
%     axis('image')
%     axis('ij')
% end
%

%Question 7:

home = godthem256;
tools = few256;

%extractedge(tools, 8, 9, 'same');

%Question 8:

%testimage1 = triangle128;
% smalltest1 = binsubsample(testimage1);
% testimage2 = houghtest256;
% smalltest2 = binsubsample(binsubsample(testimage2));
%showgrey(smalltest1);
% [linepar, acc] = houghedgeline(triangle128, 8, 8, 400, 180, 5, 0);
% subplot(1, 2, 1);
% showgrey(acc);
% subplot(1, 2, 2);
% draw_from_hough(linepar, triangle128);
% subplot(1, 4, 1);
% houghedgeline(houghtest256, 8, 8, 400, 180, 8, 1);
% subplot(1, 4, 2);
% houghedgeline(tools, 8, 8, 400, 200, 12, 1);
% subplot(1, 4, 3);
% houghedgeline(phonecalc256, 3, 18, 400, 180, 13, 1);
% subplot(1, 4, 4);
% houghedgeline(godthem256, 3, 10, 256, 256, 10, 1);
% figure()
% subplot(1, 2, 1);
% [linepar, acc] = houghedgeline(tools, 8, 8, 400, 200, 12, 1);
% subplot(1, 2, 2);
% showgrey(acc);



