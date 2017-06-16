
function plot_frame( O, R, varargin )
%% plot_frame( origin, rotation_matrix, <opts> )
%
% Plots a 3D coordinate system origin.
% By default is aligned with the right-handed XYZ global coordinate system.
% Use optional arguments to customise:
%
% ------------------------------------------------------------------------
% KEY           VALUE [DEFAULT]   DESCRIPTION
% ------------------------------------------------------------------------
% 'axes'        {'x', [and/or] 'y', [and/or] 'z'}
%                                 Only plot axes listed
% 'labels'      boolean
%                          Whether to print coordinate system labels
% 'index'       str ['1']  String index on labels (default str='1')
% ------------------------------------------------------------------------
% 'framelabelshift'  f   Amount to shift frame label (default s=[0 0 0])
% 'axeslabelshift'   f   Amount to shift x,y,z labels along their length (default s=[0.01 0.01 0.01])
% 'labelsize'   f [12]   Font size for labels
% 'length'      f [0.05] Length of axes lines
% 'headlength'  f [0.02] Length of arrow head
% 'arrowangle'  f [25]   Angle (°) of arrowhead "quills"
% 'linecolour'  [R G B]  Red-Green-Blue colour of axis lines
% 'headcolour'  [R G B]  Red-Green-Blue colour of arrowhead faces
% 'headopacity' f        Opacity of arrowhead faces
% ------------------------------------------------------------------------

%% Define inputs

p = inputParser;

p.addRequired('O');
p.addRequired('R');

p.addOptional('axes','xyz');
p.addOptional('labels',true);
p.addOptional('index','1');

p.addOptional('length',0.05);
p.addOptional('headlength',0.02);
p.addOptional('arrowangle',25);
p.addOptional('linecolour',[0 0 0]);
p.addOptional('headcolour',0.5*[1 1 1]);
p.addOptional('headopacity',0.9);
p.addOptional('axeslabelshift',0.01);
p.addOptional('framelabelshift',[0 0 0]);
p.addOptional('labelsize',12);

p.parse(O,R,varargin{:})

%% Process inputs

al     = p.Results.length;
hl     = p.Results.headlength;
ang    = p.Results.arrowangle;
ni     = p.Results.index;
ecol   = p.Results.linecolour;
col    = p.Results.headcolour;
opac   = p.Results.headopacity;

labels_bool     = p.Results.labels;
plot_axes       = p.Results.axes;
axeslabelshift  = p.Results.axeslabelshift;
framelabelshift = p.Results.framelabelshift;
labelsize       = p.Results.labelsize;

if numel(axeslabelshift) == 1
  axeslabelshift = [axeslabelshift, axeslabelshift, axeslabelshift];
end


%% Hard-coded rotation matrices

% Rz(90°):
RzP90 = [0    -1     0;
         1     0     0;
         0     0     1];

% Ry(-90°):
RyM90 = [0     0    -1;
         0     1     0;
         1     0     0];

       
%% Definition of a single axis (X)
%
% This is rotated to plot the other two in Y and Z.

ax = [al; 0; 0]; % axis end point
pxy = ax - hl*[cosd(ang);  sind(ang); 0]; % one point of the arrowhead
pxz = ax - hl*[cosd(ang); 0;  sind(ang)]; % one point of the other arrowhead
head1 = [ax pxy pxy.*[1; -1; 1]]; % arrowhead points in XY plane
head2 = [ax pxz pxz.*[1; 1; -1]]; % arrowhead points in XZ plane


%% Plot

hold on

if strcmp(plot_axes,'xyz')
  if labels_bool
    text(-framelabelshift(1)+O(1),...
         -framelabelshift(2)+O(2),...
         -framelabelshift(3)+O(3),['O_{',ni,'}'],...
         'FontSize',labelsize,'BackgroundColor',[1 1 1]);
  end
end

if any(plot_axes=='x')
  plot_one_coord(O,R*ax,      R*head1,      R*head2,      ['x_{',ni,'}'],[axeslabelshift(1); 0; 0])
end

if any(plot_axes=='y')
  plot_one_coord(O,R*RzP90*ax,R*RzP90*head1,R*RzP90*head2,['y_{',ni,'}'],[0; axeslabelshift(2); 0])
end

if any(plot_axes=='z')
  plot_one_coord(O,R*RyM90*ax,R*RyM90*head1,R*RyM90*head2,['z_{',ni,'}'],[0; 0; axeslabelshift(3)])
end


%% Nested functions

  function plot_one_coord(O,a,head1,head2,name,ns)
    if labels_bool
      text(ns(1)+O(1)+a(1),ns(2)+O(2)+a(2),ns(3)+O(3)+a(3),name,'FontSize',labelsize,'BackgroundColor',[1 1 1]);
    end
    
    plot3(O(1)+[0 a(1)],O(2)+[0 a(2)],O(3)+[0 a(3)],'color',ecol);
    patch(O(1)+head1(1,:),O(2)+head1(2,:),O(3)+head1(3,:),ecol,'facealpha',opac,'facecolor',col);
    patch(O(1)+head2(1,:),O(2)+head2(2,:),O(3)+head2(3,:),ecol,'facealpha',opac,'facecolor',col);
  end

end


% Licence included in README.