
function Rab = vec2rotmat(Va,Vb)
%
% Creates a rotation matrix Rab describing the rotation from vector Va
% to Vb in global XYZ coordinate system.
%
% Coordinate frames are defined with the local axis defined by:
%
%  * Y axis of each frame aligned with Va/Vb respectively,
%  * X axes tangential to the plane defined by Va&Vb,  
%  * Z axes normal to both (i.e., parallel to the plane defined by Va&Vb)

Va = Va/norm(Va);
Vb = Vb/norm(Vb);

Ax = cross(Va,Vb);
Ay = Va;
Az = cross(Ax,Ay);

Bx = Ax;
By = Vb;
Bz = cross(Bx,By);

RL  = [Ax';Ay';Az']
RLT = transpose(RL);

Lab = [dot(Ax,Bx), dot(Ay,Bx), dot(Az,Bx);
       dot(Ax,By), dot(Ay,By), dot(Az,By);
       dot(Ax,Bz), dot(Ay,Bz), dot(Az,Bz)]

Rab = RL*Lab*RLT;

end

% License included in README.