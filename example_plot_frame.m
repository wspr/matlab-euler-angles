%% Example of PLOT_FRAME
%
%% Full set of options:

help plot_frame

%% A quick example:

figure(1); clf; hold on

R = [1 0 0
     0 1 0
     0 0 1];

plot_frame([0; 0; 0],R);

R = [1 0 0
     0 1 0
     0 0 1];

plot_frame([0.1; 0.1; 0],R,'index','2','length',0.1,'headlength',0.01);

R = [1  0  0
     0  0 -1
     0  1  0];

plot_frame([0.1; 0; 0.1],R,'index','3','headcolour',[1 0 0]);

view(3)
axis equal