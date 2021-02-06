function convolution = gaussfft(pic, t)
[usize, vsize] = size(pic);
umax = usize/2;
vmax = vsize/2;
[u, v] = meshgrid(umax - usize : umax - 1, vmax - vsize : vmax - 1);
gauss = fftshift((1/(2 * pi * t)) * exp(-(u.^2 + v.^2)/(2*t)));
gaussHat = fft2(gauss);
picHat = fft2(pic);
result = picHat .* gaussHat;
convolution = real(ifft2(result));

