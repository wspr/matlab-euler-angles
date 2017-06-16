%% Unit tests for to/from Euler angles

clc

eul_order = {'XYZ','XZY','YXZ','YZX','ZXY','ZYX'};
Neuler = numel(eul_order);

c = 0;
thresh = 1e-14;

Niter = 1000;
err = nan(Niter,3);

ang_range_min = -pi/2;
ang_range_max = +pi/2;
fprintf('Testing over ±pi/2 range.\n')

for ii = 1:Neuler
  for jj = 1:Niter
    
    x = ang_range_min+rand(1,3)*(ang_range_max-ang_range_min);
    R = eulang2rotmat(x,eul_order{ii});
    X = rotmat2eulang(R,eul_order{ii});
    

    err(jj,:) = X-x;
    if any( abs(X-x) > thresh )
      c = c+1;
    end
    
  end
end

fprintf('Max abs error: %e\n',max(abs(err(:))))
fprintf('Count of abs err > %1.1e: %i/%i\n',thresh,c,Niter)