function result=Gauss_quadrature_test_triangular_mesh(load_function_name,number_of_Gauss_points,vertices,basis_type_test,basis_index_test,derivative_order_x_test,derivative_order_y_test)

result=0;
[Gauss_weights_loc_triangle,Gauss_points_loc_triangle]=Gauss_weights_points_loc_triangle(number_of_Gauss_points,vertices);

for i=1:number_of_Gauss_points
    result=result+Gauss_weights_loc_triangle(i)*feval(load_function_name,Gauss_points_loc_triangle(i,1),Gauss_points_loc_triangle(i,2))...
        *triangular_loc_basis(Gauss_points_loc_triangle(i,1),Gauss_points_loc_triangle(i,2),vertices,basis_type_test,basis_index_test,derivative_order_x_test,derivative_order_y_test); 
end