function result=Gauss_quadrature_for_1D_integral_trial_test(coe_fun,number_of_Gauss_points,...
    vertices_trial,basis_type_trial,basis_index_trial,derivative_order_trial,...
    vertices_test,basis_type_test,basis_index_test,derivative_order_test)

lower_bound=min(vertices_trial);
upper_bound=max(vertices_trial);
[Gauss_weights_loc_1D,Gauss_points_loc_1D]=Gauss_weights_points_loc_1D(lower_bound,upper_bound,number_of_Gauss_points);

result=0;
for i=1:number_of_Gauss_points
    result=result+Gauss_weights_loc_1D(i)*feval(coe_fun,Gauss_points_loc_1D(i))...
       *local_basis_1D(Gauss_points_loc_1D(i),vertices_trial,basis_type_trial,basis_index_trial,derivative_order_trial)...
       *local_basis_1D(Gauss_points_loc_1D(i),vertices_test ,basis_type_test ,basis_index_test ,derivative_order_test);    
end