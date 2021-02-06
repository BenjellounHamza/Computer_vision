function [linepar, acc] = houghedgeline(pic, scale, gradmagnthreshold, nrho, ntheta, nlines, verbose)
    
    edgecurves = extractedge(pic, scale, gradmagnthreshold, 'same');
    % The constraint of the threshold is already verified in edgecurves
    [linepar, acc] = houghline(edgecurves, Lv(pic),nrho, ntheta, gradmagnthreshold, nlines, 0);
    if(verbose ~= 0)
        draw_from_hough(linepar, pic);
    end
end