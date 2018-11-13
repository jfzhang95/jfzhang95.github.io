function b=assemble_vector_poisson_1D(vector_size,coe_fun,P,T,Tb_test,number_of_test_local_basis,number_of_elements,number_of_Gauss_points,basis_type_test,derivative_order_test)

b=zeros(vector_size,1);
for n=1:number_of_elements    
    vertices=P(:,T(:,n));        
    for beta=1:number_of_test_local_basis
        temp=Gauss_quadrature_for_1D_integral_test(coe_fun,number_of_Gauss_points,vertices,basis_type_test,beta,derivative_order_test);
        b(Tb_test(beta,n),1)=b(Tb_test(beta,n),1)+temp;
    end 
end

