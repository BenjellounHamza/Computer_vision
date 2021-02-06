function edgecurves = extractedge(inpic, scale, threshold, shape)

% use Gaussian filter with the variance = scale.

smoothed_pic = discgaussfft(inpic, scale);

% second and third derivate:
lv = Lv(smoothed_pic);
Lvv = Lvvtilde(smoothed_pic, shape);
Lvvv = Lvvvtilde(smoothed_pic, shape);
 
maskpic1 =  (Lvvv < 0) - 0.4;

% cross zeros with mask
crosszero_masked = zerocrosscurves(Lvv, maskpic1);

% Leave only points that are greater than the threshold

maskpic2 = (lv - threshold > 0) - 0.4;
edgecurves = thresholdcurves(crosszero_masked, maskpic2);

overlaycurves(inpic, edgecurves);

end