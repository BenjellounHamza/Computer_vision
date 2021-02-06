%Fhat = zeros(128, 128);
%Fhat(p , q ) = 1;
%F = ifft2(Fhat);
%Fabsmax = max(abs(F(:)));
%showgrey(real(F), 64, -Fabsmax, Fabsmax)
%showgrey(imag(F), 64, -Fabsmax, Fabsmax)
%showgrey(abs(F), 64, -Fabsmax, Fabsmax)
%showgrey(angle(F), 64, -pi, pi)

%Question 1:
%sz = 128
%fftwave(5, 6, sz)
%fftwave(9, 5, sz)
%fftwave(17, 9, sz)
%fftwave(17, 121, sz)
%fftwave(5, 1, sz)
%fftwave(125, 1, sz)

%Linearity

%F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
%G = F';
%H = F + 2 * G;

%Fhat = fft2(F);
%Ghat = fft2(G);
%Hhat = fft2(H);

%showgrey(log(1 + abs(Fhat)));
%showgrey(log(1 + abs(Ghat)));
%showgrey(log(1 + abs(Hhat)));

%showgrey(log(1 + abs(fftshift(Hhat))));

%Multiplication

%F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
%G = F';
%showgrey(F .* G);
%showfs(fft2(F .* G));

%showfs(fftshift(conv2(1/128*fftshift(fft2(F)), 1/128*fftshift(fft2(G)), 'same')))

%Scaling

%F = [zeros(60, 128); ones(8, 128); zeros(60, 128)] .* [zeros(128, 48) ones(128, 32) zeros(128, 48)];
%showgrey(F)
%showfs(fft2(F));

%Rotation

%G = rot(F, alpha );
%showgrey(G)
%axis on
%Ghat = fft2(G);
%Hhat = rot(fftshift(Ghat), -alpha );
%showgrey(log(1 + abs(Hhat)))

%rotation(F);
%img = phonecalc128;
%a = 10^-10
%question_13(img, a);

%question 14:
%t = 0.1;
%pic = deltafcn(128, 128);
%psf = gaussfft(pic, 100);
%variance(psf)
%filter(pic)
%question_16(phonecalc128);
%office = office256;
%add = gaussnoise(office, 16);
%sap = sapnoise(office, 0.1, 255);
%showgrey(office)
%showgrey(add)
%showgrey(sap)
%question_16(add);

%img = phonecalc256;
%smoothimg = img;
%N=5;
%for i=1:N
%if i>1
% generate subsampled versions
%img = rawsubsample(img);
%smoothimg = ideal(smoothimg, 0.2);
%smoothimg = rawsubsample(smoothimg);
%end
%subplot(2, N, i)
%showgrey(img)
%subplot(2, N, i+N)
%showgrey(smoothimg)
%end
