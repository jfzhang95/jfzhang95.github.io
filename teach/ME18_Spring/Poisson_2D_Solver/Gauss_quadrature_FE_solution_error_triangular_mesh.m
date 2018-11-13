function result=Gauss_quadrature_FE_solution_error_triangular_mesh(uh_local,exact_solution,vertices,number_of_Gauss_points,basis_type,derivative_order_x,derivative_order_y)

[Gauss_weights_loc_triangle,Gauss_points_loc_triangle]=Gauss_weights_points_loc_triangle(number_of_Gauss_points,vertices);

result=0;
for i=1:number_of_Gauss_points
    result=result+Gauss_weights_loc_triangle(i)...
        *(feval(exact_solution,Gauss_points_loc_triangle(i,1),Gauss_points_loc_triangle(i,2))...
        - FE_solution_triangle(Gauss_points_loc_triangle(i,1),Gauss_points_loc_triangle(i,2),uh_local,vertices,basis_type,derivative_order_x,derivative_order_y))^2;    
end