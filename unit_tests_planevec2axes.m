%% UNIT TESTS for planevec2axes

clc

ii = 0;

XN = [1; 0; 0];
YN = [0; 1; 0];
ZN = [0; 0; 1];

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('X',XN,'Y',YN);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('X',XN,'XY',[1 1 0]);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('X',[2 0 0],'Y',[0 2 0]);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('X',[2 0 0],'XY',[2 2 0]);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('X',XN,'Z',ZN);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('X',XN,'XZ',[1 0 1]);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('Y',YN,'X',XN);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('Y',YN,'XY',[1 1 0]);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('Y',YN,'Z',ZN);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('Y',YN,'ZY',[0 1 1]);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('Z',ZN,'X',XN);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('Z',ZN,'XZ',[1 0 1]);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('Z',ZN,'Y',YN);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

ii = ii + 1; fprintf('Test %2i.\n',ii)
[X, Y, Z] = planevec2axes('Z',ZN,'YZ',[0 1 1]);
assert(all(X==XN))
assert(all(Y==YN))
assert(all(Z==ZN))
clear X Y Z

