
function varargout = planevec2axes( s1, v1, s2, v2, O )

%% Rotation matrix from two vectors defining a plane
%
% Form a coordinate system using two vectors and their cross product.
% Vectors are not assumed to be unit vectors, and are normalised to be column-wise.
% The axes are always labeled X, Y, Z with a right-hand orientation, and
% the designation of which vectors (`v1`, `v2`) are which axes is explicit in the
% arguments (`s1`, `s2`) to the function.
%
% Outputs are either a rotation matrix or a set of unit vectors, or a
% transformation matrix if an original is provided:
%
% ------------------------------------------------------------------------
% rotM      = planevec2axes( s1, v1, s2, v2)
% [X, Y, Z] = planevec2axes( s1, v1, s2, v2)
% transM    = planevec2axes( s1, v1, s2, v2, O)
% ------------------------------------------------------------------------
%
% If the two vectors are orthogonal, the third axis is formed from their
% cross product:
%
% ------------------------------------------------------------------------
% rotM = planevec2axes( 'X', v1, 'Y', v2)
% rotM = planevec2axes( 'X', v1, 'Z', v2)
% rotM = planevec2axes( 'Y', v1, 'X', v2)
% rotM = planevec2axes( 'Y', v1, 'Z', v2)
% rotM = planevec2axes( 'Z', v1, 'X', v2)
% rotM = planevec2axes( 'Z', v1, 'Y', v2)
% ------------------------------------------------------------------------
%
% If the two vectors are not orthogonal, their cross product is used to
% form the second axis, and the third is formed from a subsequent cross
% product:
%
% ------------------------------------------------------------------------
% rotM = planevec2axes( 'X', v1, 'XY', v2)
% rotM = planevec2axes( 'X', v1, 'XZ', v2)
% rotM = planevec2axes( 'Y', v1, 'YX', v2)
% rotM = planevec2axes( 'Y', v1, 'YZ', v2)
% rotM = planevec2axes( 'Z', v1, 'ZX', v2)
% rotM = planevec2axes( 'Z', v1, 'ZY', v2)
% ------------------------------------------------------------------------
%
% In the latter case, the order of the "two letter" second input is not
% important. E.g., 'XY' is the same as 'YX'.


% Validate input:
if numel(s1) == 1 && numel(s2) == 1
  assert( abs(dot(v1,v2))<eps , 'Two input vectors must be orthogonal.' )
else
  assert( 1-abs(dot(v1,v2))<eps , 'Two input vectors must not be parallel.' )
end

% Ensure column vectors and that s2 is ordered alphabetically:
v1 = v1(:);
v2 = v2(:);
s2 = sort(s2);

% Initialise:
axes = struct('X',[],'Y',[],'Z',[]);

% The main routine:
switch s1
  
  case 'X'
    axes.X = v1;
    
    switch s2
      case 'Y'
        axes.Y = v2;
        axes.Z = cross(axes.X,axes.Y);
        
      case 'XY'
        axes.Z = cross(axes.X,v2);
        axes.Y = cross(axes.Z,axes.X);
        
      case 'Z'
        axes.Z = v2;
        axes.Y = cross(axes.Z,axes.X);
        
      case 'XZ'
        axes.Y = cross(v2,axes.X);
        axes.Z = cross(axes.X,axes.Y);
        
      otherwise
        error('Unknown option pair "%s"/"%s"',s1,s2)
        
    end
    
    
  case 'Y'
    axes.Y = v1;
    
    switch s2
      case 'X'
        axes.X = v2;
        axes.Z = cross(axes.X,axes.Y);
        
      case 'XY'
        axes.Z = cross(v2,axes.Y);
        axes.X = cross(axes.Y,axes.Z);
        
      case 'Z'
        axes.Z = v2;
        axes.X = cross(axes.Y,axes.Z);
        
      case 'YZ'
        axes.X = cross(axes.Y,v2);
        axes.Z = cross(axes.X,axes.Y);
        
      otherwise
        error('Unknown option pair "%s"/"%s"',s1,s2)
        
    end
    
    
  case 'Z'
    axes.Z = v1;
    
    switch s2
      case 'X'
        axes.X = v2;
        axes.Y = cross(axes.Z,axes.X);
        
      case 'XZ'
        axes.Y = cross(axes.Z,v2);
        axes.X = cross(axes.Y,axes.Z);
        
      case 'Y'
        axes.Y = v2;
        axes.X = cross(axes.Y,axes.Z);
        
      case 'YZ'
        axes.X = cross(v2,axes.Z);
        axes.Y = cross(axes.Z,axes.X);
        
      otherwise
        error('Unknown option pair "%s"/"%s"',s1,s2)
        
    end
    
  otherwise
    error('Unknown first vector option "%s"',s1)
end

% Unit vectors for each axis:
X = axes.X/norm(axes.X);
Y = axes.Y/norm(axes.Y);
Z = axes.Z/norm(axes.Z);

% Outputs:

if nargin == 5
  % transformation matrix output:
  varargout{1} = [X Y Z O(:); 0 0 0 1];  
elseif nargin == 4
  if nargout == 1
    % rotation matrix output:
    varargout{1} = [X Y Z];
  elseif nargout == 3
    % unit vector axes output:
    varargout = {X, Y, Z};
  end
end

end

% Licence included in README.
