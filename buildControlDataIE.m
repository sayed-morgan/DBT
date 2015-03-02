function theControl = buildControlDataIE()

%Farb-/Dichtekorrekturen
theControl.WB.DeltaD = [0;0;0];

%Gradation/Offsetkorrektur
theControl.GradationOffset.Offset = 0.8;
theControl.GradationOffset.RGBGradation = 1.2;

%Kappa
theControl.bipol.Kappa = 1;
theControl.bipol.gauss.size = [ 9 9 ];
theControl.bipol.gauss.sigma = 10;

theControl.ganglion.Kappa = 1;
theControl.ganglion.gauss.size = [ 3 3 ];
theControl.ganglion.gauss.sigma = 5;

%demosaicing
theControl.demosaic = 0;

end %buildControlData