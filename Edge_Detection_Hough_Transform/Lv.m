
function pixels = Lv(inpic, shape)
    dxmask = [0 0 0; -1/2 0 1/2; 0 0 0];
    dymask = [0 -1/2 0; 0 0 0; 0 1/2 0];
    if (nargin < 2)
        shape = 'same';
    end
    Lx = filter2(dxmask, inpic, shape);
    Ly = filter2(dymask, inpic, shape);
    pixels = sqrt(Lx.^2 + Ly.^2);
end