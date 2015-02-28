close all hidden;
clear variables;

%Initialisierung Steuerdaten:
myControl = buildControlDataIE();

%HDR-Bild einlesen:
HDRImage_sRGBLinear = hdr_imread();
imdisplay(HDRImage_sRGBLinear);

%Anzeige als sRGB Bild:
% mysRGBImage = imColorTransform( HDRImage_sRGBLinear, 'ICCProfiles/sRGBLinear.icc', '*sRGB'); 
% imdisplay( mysRGBImage, 'HDR Input', 1);

% img to CFA
CFA = im2mosaic(HDRImage_sRGBLinear);
%imdisplay(CFA, 'CFA');

% bipolar cells
% The default value for hsize is [3 3]; the default value for sigma is 0.5.
Imbi = tonemap(CFA, myControl.Kappa, [3 3], 0.2);
% imdisplay(Imbi, 'bipolar');

% ganglion cells
Imga = tonemap(Imbi, myControl.Kappa, [6 6], 1);
% imdisplay(Imga, 'ganglion');


% demosaicing
I16bit = im2uint16(Imga);
Idem = demosaic(I16bit, 'rggb');
imdisplay(Idem, 'Demosaiced', 1);