function A=assemble_matrix_poisson_1D(matrix_size,coe_fun,P,T,Tb_trial,Tb_test,...
    number_of_trial_local_basis,number_of_test_local_basis,...
    number_of_elements,number_of_Gauss_points,...
    basis_type_trial,derivative_order_trial,basis_type_test,derivative_order_test)

A=sparse(matrix_size(1),matrix_size(2));

for n=1:number_of_elements
    vertices=P(:,T(:,n));
    
    for alpha=1:number_of_trial_local_basis
        for beta=1:number_of_test_local_basis
            temp=Gauss_quadrature_for_1D_integral_trial_test(coe_fun,number_of_Gauss_points,...
                vertices,basis_type_trial,alpha,derivative_order_trial,...
                vertices,basis_type_test,beta,derivative_order_test);
            A(Tb_test(beta,n),Tb_trial(alpha,n))=A(Tb_test(beta,n),Tb_trial(alpha,n))+temp;
        end
    end
end