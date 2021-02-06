function filter(pic)
compteur = 1;
subplot(1, 6, compteur);
showfs(fftshift(pic))
title('original image')
for t = [0.1  0.3 1 10 100]
    % plot psf
    subplot(1, 6, compteur);
    compteur = compteur + 1;
    psf = gaussfft(pic, t);
    showfs(fftshift(psf))
    title(sprintf('t = %.2f', t))
end