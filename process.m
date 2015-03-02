function Iout = process( myControl, image )
%PROCESS Summary of this function goes here
%   Detailed explanation goes here
if myControl.demosaic
    CFA = im2mosaic(image);
else
    CFA = double(image);
    CFA = CFA/max(CFA(:));
end
%imdisplay(CFA, 'CFA');

% bipolar cells
% The default value for hsize is [3 3]; the default value for sigma is 0.5.
Imbi = tonemap(CFA, myControl.bipol.Kappa, myControl.bipol.gauss.size, myControl.bipol.gauss.sigma);
% imdisplay(Imbi, 'bipolar');

% ganglion cells
Imga = tonemap(Imbi, myControl.ganglion.Kappa, myControl.ganglion.gauss.size, myControl.ganglion.gauss.sigma);
% imdisplay(Imga, 'ganglion');


% demosaicing
if myControl.demosaic
    I16bit = im2uint16(Imga);
    Idem = demosaic(I16bit, 'rggb');
    Iout = Idem;
else
    Iout = Imga;
end

% convert to sRGB
Iout = imColorTransform( Iout, 'ICCProfiles/sRGBLinear.icc', '*sRGB'); 
disp(min(Iout(:)));
disp(max(Iout(:)));
end

