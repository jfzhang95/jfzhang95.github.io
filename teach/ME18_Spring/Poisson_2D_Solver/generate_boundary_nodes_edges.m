function [boundary_nodes,boundary_edges]=generate_boundary_nodes_edges(N1_basis,N2_basis,N1_mesh,N2_mesh)
% Generate the information matrices for boundary nodes and boundary edges
% 
% boundary_nodes(1,k)    -- specify the type of the kth boundary node
%                    =-1 -- Dirchlet boundary node
%                    =-2 -- Neumann boundary node
%                    =-3 -- Robin boundary node
% boundary_nodes(2,k)    -- global index of the kth boundary node among all
%                           nodes of FE. That is, the index of FE is used
%                           here.
%
% boundary_edges(1,k)    -- specify the type of the kth boundary edge
%                    =-1 -- Dirchlet boundary edge
%                    =-2 -- Neumann boundary edge
%                    =-3 -- Robin boundary edge
% boundary_edges(2,k)    -- index of the element which contains th kth
%                           boundary edge
% boundary_edges(3:4,k)  -- indices of the two end points of the kth
%                           boundary edge among all grid points, not the
%                           nodes of FE. That is, the index of mesh is used
%                           here.

number_of_boundary_nodes=2*(N1_basis+N2_basis);
boundary_nodes=zeros(2,number_of_boundary_nodes);

% Set all nodes to be Dirichlet type.
boundary_nodes(1,:)=-1;

% The index in the following is associated with index in "generate_P_T_triangular_mesh.m"

% bottom boundary nodes
for k=1:N1_basis
    boundary_nodes(2,k)=(k-1)*(N2_basis+1)+1;
end
% right boundary nodes
for k=N1_basis+1:N1_basis+N2_basis
    boundary_nodes(2,k)=N1_basis*(N2_basis+1)+k-N1_basis;
end
% top boundary nodes
for k=N1_basis+N2_basis+1:2*N1_basis+N2_basis
    boundary_nodes(2,k)=(2*N1_basis+N2_basis+2-k)*(N2_basis+1);
end
% left boundary nodes
for k=2*N1_basis+N2_basis+1:number_of_boundary_nodes
    boundary_nodes(2,k)=2*N1_basis+2*N2_basis+2-k;    
end


number_of_boundary_edges=2*(N1_mesh+N2_mesh);
boundary_edges=zeros(4,number_of_boundary_edges);
% Set all edges to be Dirichlet type
boundary_edges(1,:)=-1;

%The index in the following is associated with the index in "generate_M_T_triangle.m".
%bottom boundary edges.
for k=1:N1_mesh
    boundary_edges(2,k)=(k-1)*2*N2_mesh+1;
    boundary_edges(3,k)=(k-1)*(N2_mesh+1)+1;
    boundary_edges(4,k)=k*(N2_mesh+1)+1;
end

%right boundary edges.
for k=N1_mesh+1:N1_mesh+N2_mesh
    boundary_edges(2,k)=(N1_mesh-1)*2*N2_mesh+2*(k-N1_mesh);
    boundary_edges(3,k)=N1_mesh*(N2_mesh+1)+k-N1_mesh;
    boundary_edges(4,k)=N1_mesh*(N2_mesh+1)+k-N1_mesh+1;
end

%top boundary edges.
for k=N1_mesh+N2_mesh+1:2*N1_mesh+N2_mesh
    boundary_edges(2,k)=(2*N1_mesh+N2_mesh+1-k)*2*N2_mesh;
    boundary_edges(3,k)=(2*N1_mesh+N2_mesh+2-k)*(N2_mesh+1);
    boundary_edges(4,k)=(2*N1_mesh+N2_mesh+1-k)*(N2_mesh+1);
end

%left boundary edges.
for k=2*N1_mesh+N2_mesh+1:number_of_boundary_edges
    boundary_edges(2,k)=2*(2*N1_mesh+2*N2_mesh+1-k)-1;
    boundary_edges(3,k)=2*N1_mesh+2*N2_mesh+2-k;
    boundary_edges(4,k)=2*N1_mesh+2*N2_mesh+1-k;
end

