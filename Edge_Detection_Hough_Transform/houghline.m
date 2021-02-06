function [linepar, acc] = houghline(curves, magnitude, nrho, ntheta, threshold, nlines, verbose)
    % split the space into ntheta bins
    thetas = linspace(-pi/2, pi/2, ntheta);
    % D should be sqrt(x_max^2 + y_max^2)
    x_max = size(magnitude, 1);
    y_max = size(magnitude, 2);
    D = sqrt(x_max^2 + y_max^2);
    % split the space into nrhos bins
    rhos = linspace(-D, D, nrho);
    %acc matrix to compute
    acc = zeros(nrho, ntheta);
    % move from curves coordinate to image coordinate
    insize = size(curves, 2);
    trypointer = 1;

    numcurves = 0;

    while trypointer <= insize
        polylength = curves(2, trypointer);

        numcurves = numcurves + 1;

        trypointer = trypointer + 1;

        for polyidx = 1:polylength
            x = curves(2, trypointer);
            y = curves(1, trypointer);
            if(magnitude(round(x), round(y)) > threshold)
                %compute all rhos (hough transform)œ
                for i=1:length(thetas)
                    theta = thetas(i);
                    rho = x*cos(theta) + y*sin(theta);
                    % find the adequate bin
                    j_adeq = 0;
                    for j=1:length(rhos)
                        if rhos(j) > rho
                            break;
                        end
                        j_adeq = j;
                    end
                    acc(j_adeq, i) = acc(j_adeq, i) + 1;
                    %for question 10 we should replace 1 by h(magnitude(x, y))
                    %if we choose just abs(L_v(x, y))
                    %acc(j_adeq, i) = acc(j_adeq, i) + magnitude(round(x), round(y))^2;
                end
            end
            trypointer = trypointer + 1;
         end
    end

    %find lines to return
    
    linepar = zeros(nlines, 2);
    
    [pos, value] = locmax8(acc);
    [~, indexvector] = sort(value);
    nmaxima = size(value, 1);
    
    if nlines > nmaxima
        nlines = nmaxima;
    end
    for idx = 1:nlines
        rhoidxacc = pos(indexvector(nmaxima - idx + 1), 1);
        thetaidxacc = pos(indexvector(nmaxima - idx + 1), 2);
        linepar(idx, :) = [thetas(thetaidxacc) rhos(rhoidxacc)];;
    end
    
    if(verbose ~= 0)
        draw_from_hough(linepar, magnitude);
    end
    
end