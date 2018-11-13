function b=assemble_vector_triangular_mesh(load_function_name,P,T,Tb_test,vector_size,number_of_loc_basis_test,number_of_elements,number_of_Gauss_points,basis_type_test,derivative_order_x_test,derivative_order_y_test)
b=zeros(vector_size,1);

for n=1:number_of_elements
   vertices=P(:,T(:,n));
   for beta=1:number_of_loc_basis_test
       temp=Gauss_quadrature_test_triangular_mesh(load_function_name,number_of_Gauss_points,vertices,basis_type_test,beta,derivative_order_x_test,derivative_order_y_test);
       b(Tb_test(beta,n),1)=b(Tb_test(beta,n),1)+temp;
   end
end
