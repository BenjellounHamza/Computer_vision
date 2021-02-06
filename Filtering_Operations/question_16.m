function question_16(pic)
subplot(2,3 , 1);
showgrey(pic)
title('original');
compteur = 2;
for t = [0.1 0.2 0.3 0.4 0.5]
    % plot psf
    subplot(2, 3, compteur);
    compteur = compteur + 1;
    psf = ideal(pic, t);
    showgrey(psf)
    title(sprintf('cutoff = %.2f', t))
end

