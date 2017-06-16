%% Example of Euler angles

%% eulang2rotmat and rotmat2eulang

clc

eul_order = 'YZX';
eul_ang = [0.1 0.4 0.3];
R = eulang2rotmat(eul_ang,eul_order)
eul_ang_calc = rotmat2eulang(R,eul_order)

assert(all(abs(eul_ang-eul_ang_calc)<eps),'Calculated Euler angles don''t match expected.')

%% Vectors to Rotation matrix
%
% works

clc

Va = [1;0;0];
Vb = [0;0;1];
% Expect a -90° rotation around Y to transform A to B
Rab = vec2vec2rotmat(Va,Vb)
eul = rotmat2eulang(Rab,'XYZ')
expected = eulang2rotmat([0,-pi/2,0],'XYZ')

[Vb Rab*Va]


%% another example
%
% works

clc

Va = [1;0;0];
Vb = [1;0;1]; Vb = Vb/norm(Vb);
% Expect a -45° rotation around Y to transform A to B
Rab = vec2vec2rotmat(Va,Vb)
eul = rotmat2eulang(Rab,'XYZ')
expected = eulang2rotmat([0,-pi/4,0],'XYZ')

[Vb Rab*Va]


%% another example
%
% doesn't work

clc

Va = [1;0;0];
Vb = [1;1;0]; Vb = Vb/norm(Vb);
% expect +45° around Z
Rab = vec2vec2rotmat(Va,Vb)
eul = rotmat2eulang(Rab,'XYZ')
expected = eulang2rotmat([0,-pi/4,0],'XYZ')

[Vb Rab*Va]



%% random example
%
% always broken

clc 
Va = rand(3,1); Va = Va/norm(Va);
Vb = rand(3,1); Vb = Vb/norm(Vb);
Rab = vec2vec2rotmat(Va,Vb);
[Vb Rab*Va]





