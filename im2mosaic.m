function Iout = im2mosaic( Iin )
%IM2MOSAIC Convert linear rgb image to mosaiced image
%

Iin = double(Iin);
Iin = Iin/max(Iin(:));

[H W P]=size(Iin);
Iout = zeros(size(Iin,1),size(Iin,2),1);
Iout(1:2:H,1:2:W)=Iin(1:2:H,1:2:W,1);
Iout(2:2:H,1:2:W)=Iin(2:2:H,1:2:W,2);
Iout(1:2:H,2:2:W)=Iin(1:2:H,2:2:W,2);
Iout(2:2:H,2:2:W)=Iin(2:2:H,2:2:W,3);
end

