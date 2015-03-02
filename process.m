function Iout = process( myControl, image )
%PROCESS Summary of this function goes here
%   Detailed explanation goes here
if myControl.demosaic
    CFA = im2mosaic(image);
else
    CFA = im2double(image);
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
    Iout = im2double(Idem);
else
    Iout = Imga;
end

%normalize
% Iout = normalizeImage( Iout, myControl.WB.DeltaD);

% gradation & offset
disp(myControl.GradationOffset.RGBGradation);
disp(myControl.GradationOffset.Offset);
Iout = Iout.* myControl.GradationOffset.RGBGradation - myControl.GradationOffset.Offset;

% convert to sRGB
Iout = im2uint16(Iout);
Iout = imColorTransform( Iout, 'ICCProfiles/sRGBLinear.icc', '*sRGB'); 
disp(min(Iout(:)));
disp(max(Iout(:)));
end

