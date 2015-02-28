function theHDRImage_sRGBLinear = hdr_imread()

%Bildauswahl:
[myTotalFileName, myStatus] = getRawFile4Read( '*.*');
if myStatus==0
    return;
end

%Bild einlesen
myHDRAdobeRGB16 = imread( myTotalFileName);
[mySizeY, mySizeX, c] = size( myHDRAdobeRGB16);
myScalingFactor = min( mySizeY, mySizeX) / 800;
myHDRAdobeRGB16Small = imresize( myHDRAdobeRGB16, 1/myScalingFactor, 'nearest');
theHDRImage_sRGBLinear = imColorTransform( myHDRAdobeRGB16Small, 'ICCProfiles/AdobeRGB1998.icc', 'ICCProfiles/sRGBLinear.icc');

