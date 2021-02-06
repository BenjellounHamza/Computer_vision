function draw_from_hough(linepar, pic)
    nlines = size(linepar, 1);
    outcurves = zeros(2, 4*nlines);
    for idx = 1:nlines
        x0 = 0;
        dx = size(pic, 1)^2 + size(pic, 2)^2;
        theta = linepar(idx, 1);
        rho = linepar(idx, 2);
        if(sin(theta) ~= 0)
            dy = (rho - dx * cos(theta))/sin(theta);
            y0 = (rho - x0 * cos(theta))/sin(theta);
        else
            dy = (rho - dx * cos(theta))/0.0001;
            y0 = (rho - x0 * cos(theta))/0.0001;
        end
        
        outcurves(1, 4*(idx-1) + 1) = 0; % level, not significant
        outcurves(2, 4*(idx-1) + 1) = 3; % number of points in the curve
        outcurves(2, 4*(idx-1) + 2) = x0-dx;
        outcurves(1, 4*(idx-1) + 2) = y0-dy;
        outcurves(2, 4*(idx-1) + 3) = x0;
        outcurves(1, 4*(idx-1) + 3) = y0;
        outcurves(2, 4*(idx-1) + 4) = x0+dx;
        outcurves(1, 4*(idx-1) + 4) = y0+dy;
    end
    overlaycurves(pic, outcurves);
    axis([1 size(pic, 2) 1 size(pic, 1)]);
end