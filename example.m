%% Example of Euler angles

%% Usage

clc

eul_order = 'YZX'
eul_ang = [0.1 0.4 0.3]
R = rotation_matrix(eul_ang,eul_order)
eul_ang_calc = euler_angles(R,eul_order)


%% Stress testing

clc

eul_order = {'XYZ','XZY','YXZ','YZX','ZXY','ZYX'};
Neuler = numel(eul_order);

c = 0;
thresh = 1e-14;

Niter = 1000;
err = nan(Niter,3);

for ii = 1:Neuler
  for jj = 1:Niter
    
    x = pi/2*(2*rand(1,3)-1);
    R = rotation_matrix(x,eul_order{ii});
    X = euler_angles(R,eul_order{ii});
    
    err(jj,:) = X-x;
    if any( abs(X-x) > thresh )
      c = c+1;
    end
    
  end
end

fprintf('Max abs error: %e\n',max(abs(err(:))))
fprintf('Count of abs err > %1.1e: %i/%i\n',thresh,c,Niter)

