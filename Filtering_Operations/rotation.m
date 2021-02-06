function rotation(F)
compteur = 1;
for alpha = [30 45 60 90]
    % plot G
    G = rot(F, alpha );
    subplot(4, 3, compteur);
    compteur = compteur + 1;
    showgrey(G)
    title(sprintf('G with alpha = %d', alpha))
    % plot Ghat
    subplot(4, 3, compteur);
    compteur = compteur + 1;
    Ghat = fft2(G);
    showfs(Ghat)
    title(sprintf('Ghat with alpha = %d', alpha))
    % plot Hhat
    subplot(4, 3, compteur);
    compteur = compteur + 1;
    Hhat = rot(fftshift(Ghat), -alpha );
    showgrey(log(1 + abs(Hhat)))
    title(sprintf('Hhat with alpha = %d', alpha))
end