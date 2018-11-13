function result=FE_solution_error_triangular_mesh(uh,exact_solution,left,right,bottom,top,h_mesh,basis_type,derivative_order_x,derivative_order_y,number_of_Gauss_points)

N1_mesh=(right-left)/h_mesh(1);
N2_mesh=(top-bottom)/h_mesh(2);
number_of_elements=2*N1_mesh*N2_mesh;

[P,T]=generate_P_T_triangular_mesh(left,right,bottom,top,h_mesh,1);
if basis_type==1
    Pb=P;
    Tb=T;
elseif basis_type==2
    [Pb,Tb]=generate_P_T_triangular_mesh(left,right,bottom,top,h_mesh,2);
end

result=0;
for n=1:number_of_elements
    vertices=P(:,T(:,n));
    uh_local=uh(Tb(:,n));
    result=result+Gauss_quadrature_FE_solution_error_triangular_mesh(uh_local,exact_solution,vertices,number_of_Gauss_points,basis_type,derivative_order_x,derivative_order_y);    
end
result=sqrt(result);


