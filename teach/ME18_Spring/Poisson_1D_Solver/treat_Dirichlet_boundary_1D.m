function [A,b]=treat_Dirichlet_boundary_1D(Dirichlet_boundary_function_name,A,b,boundary_nodes,Pb)

% Deal with Dirichlet bounary nodes
%
% boundary_nodes(1,k)      specify the type of the kth boundary node
%
% boundary_nodes(1,k)=-1   Dirichlet boundary node
% boundary_nodes(1,k)=-2   Neumann boundary node
% boundary_nodes(1,k)=-3   Robin boundary node
% boundary_nodes(2,k)      global index of the kth boundary node among all
%                          nodes of FE. That is, the index of FE is used
%                          here.
% P                        store the coordinates of all the nodes

% nbn -- the total number of all the boundary nodes
nbn = size(boundary_nodes,2);

% Check all boundary nodes
for k=1:nbn
    % If the ith node x_i is a Dirichlet boundary node, then we reset the
    % ith equation in the linear system to be 1*u_i=u(x_i).
    % Also i = boundary_nodes(2,k) if boundary_nodes(1,k)==-1
    if boundary_nodes(1,k)==-1
       i=boundary_nodes(2,k);
       A(i,:)=0;
       A(i,i)=1;
       b(i,1)=feval(Dirichlet_boundary_function_name,Pb(i));
    end
    
end
