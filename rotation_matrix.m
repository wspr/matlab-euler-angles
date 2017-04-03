function rotM = rotation_matrix(rr,order)

oo = order - 'X' + 1; % 'X' -> 1, 'Y' -> 2, 'Z' -> 3
reord = [find(oo==1),find(oo==2),find(oo==3)];

c = cos(rr(reord));
s = sin(rr(reord));

RxRyRz(:,:,1) = [1 0 0; 0 c(1) -s(1); 0 s(1) c(1)];
RxRyRz(:,:,2) = [c(2) 0 s(2); 0 1 0; -s(2) 0 c(2)];
RxRyRz(:,:,3) = [c(3) -s(3) 0; s(3) c(3) 0; 0 0 1];

rotM = RxRyRz(:,:,oo(1))*RxRyRz(:,:,oo(2))*RxRyRz(:,:,oo(3));

end

% License included in README.