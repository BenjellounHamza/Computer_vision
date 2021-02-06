
function pixels = Lvvvtilde(inpic, shape)
dxmask = [0 0 0 0 0; 0 0 0 0 0; 0 -1/2 0 1/2 0; 0 0 0 0 0; 0 0 0 0 0];
dymask = dxmask';

dxxmask = [0 0 0 0 0; 0 0 0 0 0; 0 1 -2 1 0; 0 0 0 0 0; 0 0 0 0 0];
dyymask = dxxmask';
dxxxmask = conv2(dxmask, dxxmask, 'same');
dyyymask = conv2(dymask, dyymask, 'same');
dxxymask = conv2(dxxmask, dymask, 'same');
dxyymask = conv2(dyymask, dxmask, 'same');

Lx = filter2(dxmask, inpic, shape);
Ly = filter2(dymask, inpic, shape);
Lxxx = filter2(dxxxmask, inpic, shape);
Lyyy = filter2(dyyymask, inpic, shape);
Lxxy = filter2(dxxymask, inpic, shape);
Lxyy = filter2(dxyymask, inpic, shape);

pixels = Lx.^3.*Lxxx + 3*Lx.^2.*Ly.*Lxxy + 3*Lx.*Ly.^2.*Lxyy + Ly.^3.*Lyyy;

end