function [P,T]=generate_mesh_1D(left,right,h_partition,basis_type)
h=h_partition;

if basis_type==101
    N=(right-left)/h;
    P=left+(0:N)*h;
    T=[1:N;2:N+1];
elseif basis_type==102
    N=(right-left)/h;
    dh=h/2;
    dN=N*2;
    P=left+(0:dN)*dh;
    T=[1:2:dN-1;3:2:dN+1;2:2:dN];
end