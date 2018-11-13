function result=Gauss_quadrature_trial_test_triangular_mesh(coefficient_function_name,number_of_Gauss_points,vertices,basis_type_trial,basis_index_trial,derivative_order_x_trial,derivative_order_y_trial,basis_type_test,basis_index_test,derivative_order_x_test,derivative_order_y_test)

[Gauss_weights_loc_triangle,Gauss_points_loc_triangle]=Gauss_weights_points_loc_triangle(number_of_Gauss_points,vertices);

result=0;
for i=1:number_of_Gauss_points
    result=result+Gauss_weights_loc_triangle(i)...
        *feval(coefficient_function_name,Gauss_points_loc_triangle(i,1),Gauss_points_loc_triangle(i,2))...
        *triangular_loc_basis(Gauss_points_loc_triangle(i,1),Gauss_points_loc_triangle(i,2),vertices,basis_type_trial,basis_index_trial,derivative_order_x_trial,derivative_order_y_trial)...
        *triangular_loc_basis(Gauss_points_loc_triangle(i,1),Gauss_points_loc_triangle(i,2),vertices,basis_type_test,basis_index_test,derivative_order_x_test,derivative_order_y_test);
end
