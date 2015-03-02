function theControl = buildControlDataIE()

%Farb-/Dichtekorrekturen
theControl.WB.DeltaD = [0;0;0];

%Gradation/Offsetkorrektur
theControl.GradationOffset.Offset = 0.8;
theControl.GradationOffset.RGBGradation = 1.2;

%Lab-Trafo
theControl.RGB2Lab = [1/3, 1/3, 1/3; 1/2, -1/2, 0; 1/4, 1/4, -1/2];
theControl.Lab2RGB = inv( theControl.RGB2Lab);

%Kappa
theControl.bipol.Kappa = 1;
theControl.bipol.gauss.size = [ 9 9 ];
theControl.bipol.gauss.sigma = 10;

theControl.ganglion.Kappa = 1;
theControl.ganglion.gauss.size = [ 3 3 ];
theControl.ganglion.gauss.sigma = 5;

%demosaicing
theControl.demosaic = 0;

theControl.luminance = 0;

end %buildControlData