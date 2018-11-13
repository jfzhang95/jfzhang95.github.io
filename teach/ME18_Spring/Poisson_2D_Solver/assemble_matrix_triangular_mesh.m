function A=assemble_matrix_triangular_mesh(coefficient_function_name,P,T,Tb_trial,Tb_test,matrix_size,number_of_loc_basis_trial,number_of_loc_basis_test,number_of_elements,number_of_Gauss_points,basis_type_trial,derivative_order_x_trial,derivative_order_y_trial,basis_type_test,derivative_order_x_test,derivative_order_y_test)

A = sparse(matrix_size(1),matrix_size(2));

for n=1:number_of_elements
    vertices=P(:,T(:,n));
    for alpha=1:number_of_loc_basis_trial
        for beta=1:number_of_loc_basis_test
            temp=Gauss_quadrature_trial_test_triangular_mesh(coefficient_function_name,number_of_Gauss_points,vertices,basis_type_trial,alpha,derivative_order_x_trial,derivative_order_y_trial,basis_type_test,beta,derivative_order_x_test,derivative_order_y_test);
            A(Tb_test(beta,n),Tb_trial(alpha,n))=A(Tb_test(beta,n),Tb_trial(alpha,n))+temp;
        end
    end
end

