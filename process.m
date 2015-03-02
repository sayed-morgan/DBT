function Iout = process( myControl, image )
%PROCESS Summary of this function goes here
%   Detailed explanation goes here
if myControl.demosaic
    CFA = im2mosaic(image);
else
    CFA = im2double(image);
end
%imdisplay(CFA, 'CFA');

if myControl.luminance && ~myControl.demosaic
    myLogOffset = 10^-9;
    myDensityImage = log10( CFA + myLogOffset);
    myNormalizedImage = myDensityImage;%normalizeImage( myDensityImage, myControl.WB.DeltaD);
    
    %RGB->Lab-Trafo
    myLabImage = immatmul( myNormalizedImage, myControl.RGB2Lab);

    %Tone Mapping on Luminance
    myLabImage( :, :, 1) = tonemap( myLabImage( :, :, 1), myControl.bipol.Kappa, myControl.bipol.gauss.size, myControl.bipol.gauss.sigma);
    myLabImage( :, :, 1) = tonemap( myLabImage( :, :, 1), myControl.ganglion.Kappa, myControl.ganglion.gauss.size, myControl.ganglion.gauss.sigma);

    %Lab-Rücktrafo
    Imga = imMatMul(myLabImage, myControl.Lab2RGB);
    Imga = im2double(10.^Imga);
else
    % bipolar cells
    % The default value for hsize is [3 3]; the default value for sigma is 0.5.
    disp(myControl.bipol);
    disp(myControl.bipol.gauss);
    Imbi = tonemap(CFA, myControl.bipol.Kappa, myControl.bipol.gauss.size, myControl.bipol.gauss.sigma);
    % imdisplay(Imbi, 'bipolar');

    disp(myControl.ganglion);
    disp(myControl.ganglion.gauss);
    % ganglion cells
    Imga = tonemap(Imbi, myControl.ganglion.Kappa, myControl.ganglion.gauss.size, myControl.ganglion.gauss.sigma);
    % imdisplay(Imga, 'ganglion');
end

% demosaicing
if myControl.demosaic
    I16bit = im2uint16(Imga);
    Idem = demosaic(I16bit, 'rggb');
    Iout = im2double(Idem);
else
    Iout = Imga;
end

% wb
if myControl.WB.enabled
    Iout = im2uint16(Iout);
    Iout = grayworld(Iout);
    Iout = im2double(Iout);
end

% gradation & offset
Iout = Iout.* myControl.GradationOffset.RGBGradation - myControl.GradationOffset.Offset;

% convert to sRGB
Iout = imColorTransform( Iout, 'ICCProfiles/sRGBLinear.icc', 'ICCProfiles/sRGB.icm');
end

