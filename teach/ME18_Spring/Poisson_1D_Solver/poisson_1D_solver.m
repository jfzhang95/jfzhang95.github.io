function result=poisson_1D_solver(left,right,h_partition,basis_type,number_of_Gauss_points)
N_partition=(right-left)/h_partition;

if basis_type==101
    N_basis=N_partition;
elseif basis_type==102
    N_basis=N_partition*2;
end

[P,T]=generate_mesh_1D(left,right,h_partition,101);

if basis_type==101
    Pb=P;
    Tb=T;
elseif basis_type==102
    [Pb,Tb]=generate_mesh_1D(left,right,h_partition,102);
end

number_of_elements=N_partition;
matrix_size=[N_basis+1 N_basis+1];
vector_size=N_basis+1;
if basis_type==101
    number_of_trial_local_basis=2;
    number_of_test_local_basis=2;
elseif basis_type==102
    number_of_trial_local_basis=3;
    number_of_test_local_basis=3;
end

% Assemble the stiffness matrix
A=assemble_matrix_poisson_1D(matrix_size,'function_c',P,T,Tb,Tb,...
    number_of_trial_local_basis,number_of_test_local_basis,...
    number_of_elements,number_of_Gauss_points,...
    basis_type,1,basis_type,1);

% Assemble the load vector
b=assemble_vector_poisson_1D(vector_size,'function_f',P,T,Tb,...
    number_of_test_local_basis,number_of_elements,number_of_Gauss_points,...
    basis_type,0);

boundary_nodes=boundary_nodes_1D(N_basis);
[A,b]=treat_Dirichlet_boundary_1D('function_g',A,b,boundary_nodes,Pb);

result=A\b;

if basis_type==101
    h_basis=h_partition;
elseif basis_type==102
    h_basis=h_partition/2;
end

maxerror=get_maximum_error_1D(result,N_basis,left,h_basis);
maximum_erro_at_all_nodes_of_FE=maxerror

