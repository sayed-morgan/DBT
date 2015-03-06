function Iout = tonemap( Iin, Kappa, size, sigma )
%TONEMAP Applies Naka-Rushton with pixel dependent adaption factor
%   Detailed explanation goes here
h = fspecial('gaussian', size, sigma);
filteredIm = imfilter(Iin, h) + Kappa * mean(Iin(:));
imdisplay(filteredIm);
adaption = (max(Iin(:)) + filteredIm);
Iout = (Iin ./ (Iin + filteredIm)) .* adaption;
end