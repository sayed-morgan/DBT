function theNormalizedImage = normalizeImage( theDensityImage, theDeltaD)

%myMean = mean( mean( theDensityImage));
myMean = log10( mean( mean( 10.^theDensityImage)));

theNormalizedImage( :, :, 1) = theDensityImage( :, :, 1) - myMean(1) - theDeltaD( 1);
theNormalizedImage( :, :, 2) = theDensityImage( :, :, 2) - myMean(2) - theDeltaD( 2);
theNormalizedImage( :, :, 3) = theDensityImage( :, :, 3) - myMean(3) - theDeltaD( 3);

end %normalizeImage