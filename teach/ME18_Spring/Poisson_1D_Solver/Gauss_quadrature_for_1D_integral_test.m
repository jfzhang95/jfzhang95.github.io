function result=Gauss_quadrature_for_1D_integral_test(coe_fun,number_of_Gauss_points,vertices_test,basis_type_test,basis_index_test,derivative_order_test)

lower_bound=min(vertices_test);
upper_bound=max(vertices_test);
[Gauss_weights_loc_1D,Gauss_points_loc_1D]=Gauss_weights_points_loc_1D(lower_bound,upper_bound,number_of_Gauss_points);

result=0;
for i=1:number_of_Gauss_points
   result=result+Gauss_weights_loc_1D(i)*feval(coe_fun,Gauss_points_loc_1D(i))...
       *local_basis_1D(Gauss_points_loc_1D(i),vertices_test,basis_type_test,basis_index_test,derivative_order_test);
end
