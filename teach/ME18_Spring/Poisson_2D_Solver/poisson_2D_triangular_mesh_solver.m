function [result,maxerror]=poisson_2D_triangular_mesh_solver(left,right,bottom,top,h_mesh,basis_type,number_of_Gauss_points)

N1_mesh=(right-left)/h_mesh(1);
N2_mesh=(top-bottom)/h_mesh(2);

if basis_type==1
    N1_basis=N1_mesh;
    N2_basis=N2_mesh;
elseif basis_type==2
    N1_basis=N1_mesh*2;
    N2_basis=N2_mesh*2;
end

[P,T]=generate_P_T_triangular_mesh(left,right,bottom,top,h_mesh,1);
if basis_type==1
    Pb=P;
    Tb=T;
elseif basis_type==2
    [Pb,Tb]=generate_P_T_triangular_mesh(left,right,bottom,top,h_mesh,2);
end

% Assemble the stiffness matrix
number_of_elements=2*N1_mesh*N2_mesh;
number_of_FE_nodes=(N1_basis+1)*(N2_basis+1);
matrix_size=[number_of_FE_nodes,number_of_FE_nodes];
if basis_type==1
    number_of_loc_basis_trial=3;
    number_of_loc_basis_test =3;
elseif basis_type==2
    number_of_loc_basis_trial=6;
    number_of_loc_basis_test =6;
end
A1=assemble_matrix_triangular_mesh('function_c',P,T,Tb,Tb,matrix_size,number_of_loc_basis_trial,number_of_loc_basis_test,number_of_elements,number_of_Gauss_points,basis_type,1,0,basis_type,1,0);
A2=assemble_matrix_triangular_mesh('function_c',P,T,Tb,Tb,matrix_size,number_of_loc_basis_trial,number_of_loc_basis_test,number_of_elements,number_of_Gauss_points,basis_type,0,1,basis_type,0,1);
A=A1+A2;

% Assemble the load vector
vector_size=(N1_basis+1)*(N2_basis+1);
b=assemble_vector_triangular_mesh('function_f',P,T,Tb,vector_size,number_of_loc_basis_test,number_of_elements,number_of_Gauss_points,basis_type,0,0);

[boundary_nodes,boundary_edges]=generate_boundary_nodes_edges(N1_basis,N2_basis,N1_mesh,N2_mesh);

[A,b]=treat_Dirichlet_boundary_triangular_mesh('function_g',A,b,boundary_nodes,Pb);

result=A\b;

if basis_type==1
    h_basis=h_mesh;
elseif basis_type==2
    h_basis=h_mesh/2;
end
[solution2D,maxerror]=get_2D_solution_and_maximum_error(result,N1_basis,N2_basis,left,bottom,h_basis);
 