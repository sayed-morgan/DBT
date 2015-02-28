function theControl = buildControlDataIE()

%Farb-/Dichtekorrekturen
theControl.WB.DeltaD = [0;0;0];

%Lab-Trafo
theControl.RGB2Lab = [1/3, 1/3, 1/3; 1/2, -1/2, 0; 1/4, 1/4, -1/2];
theControl.Lab2RGB = inv( theControl.RGB2Lab);

%Tone Mapping
theControl.TM.Method = 'RDPhotoreceptorModel';
theControl.TM.Params.f = 10;

%Gradation/Offsetkorrektur
theControl.GradationOffset.Offset = 0.8;
theControl.GradationOffset.RGBGradation = 1.2;

%Kappa
theControl.Kappa = 1;

%Gauss
theControl.gauss.size = [ 9 9 ];
theControl.gauss.sigma = 10;

end %buildControlData