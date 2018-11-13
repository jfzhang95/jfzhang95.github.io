function check_FE_solution_error_triangular_mesh 
format short e

basis_type=1;

left=-1;
right=1;
bottom=-1;
top=1;

number_of_Gauss_points=9;
loop=2;
maxerror=zeros(loop,1);
L2_error=zeros(loop,1);
H1_error=zeros(loop,1);
Inf_error=zeros(loop,1);
h=zeros(loop,2);
for k=1:loop
    h_mesh=[1/2^(k+1),1/2^(k+1)];
    h(k)=h_mesh(1);
    [uh,maxerror(k)]=poisson_2D_triangular_mesh_solver(left,right,bottom,top,h_mesh,basis_type,number_of_Gauss_points);     
    L2_error(k)=FE_solution_error_triangular_mesh(uh,'exact_solution',left,right,bottom,top,h_mesh,basis_type,0,0,number_of_Gauss_points);    
    H1_error_x=FE_solution_error_triangular_mesh(uh,'exact_solution_x_derivative',left,right,bottom,top,h_mesh,basis_type,1,0,number_of_Gauss_points);    
    H1_error_y=FE_solution_error_triangular_mesh(uh,'exact_solution_y_derivative',left,right,bottom,top,h_mesh,basis_type,0,1,number_of_Gauss_points);    
    H1_error(k)=sqrt(H1_error_x^2+H1_error_y^2);
    Inf_error(k)=FE_solution_error_infinity_norm_triangular_mesh(uh,'exact_solution',left,right,bottom,top,h_mesh,basis_type,number_of_Gauss_points);
end

compute_convergence_rate(h,maxerror,L2_error,H1_error,Inf_error);