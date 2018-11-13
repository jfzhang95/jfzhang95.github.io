function check_FE_solution_error_poisson_1D

format short e

basis_type=102;
left=0;
right=1;
number_of_Gauss_points=4;

h_partition=1/4
uh=poisson_1D_solver(left,right,h_partition,basis_type,number_of_Gauss_points);

h_partition=1/8
uh=poisson_1D_solver(left,right,h_partition,basis_type,number_of_Gauss_points);

h_partition=1/16
uh=poisson_1D_solver(left,right,h_partition,basis_type,number_of_Gauss_points);

h_partition=1/32
uh=poisson_1D_solver(left,right,h_partition,basis_type,number_of_Gauss_points);

h_partition=1/64
uh=poisson_1D_solver(left,right,h_partition,basis_type,number_of_Gauss_points);

h_partition=1/128
uh=poisson_1D_solver(left,right,h_partition,basis_type,number_of_Gauss_points);

h_partition=1/256
uh=poisson_1D_solver(left,right,h_partition,basis_type,number_of_Gauss_points);