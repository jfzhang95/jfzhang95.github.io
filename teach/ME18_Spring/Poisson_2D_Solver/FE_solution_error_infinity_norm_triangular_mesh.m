function result=FE_solution_error_infinity_norm_triangular_mesh(uh,exact_solution,left,right,bottom,top,h_mesh,basis_type,number_of_Gauss_points)

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
    [~,Gauss_points_loc_triangle]=Gauss_weights_points_loc_triangle(number_of_Gauss_points,vertices);
    temp=max(abs(feval(exact_solution,Gauss_points_loc_triangle(:,1),Gauss_points_loc_triangle(:,2))...
        - FE_solution_triangle(Gauss_points_loc_triangle(:,1),Gauss_points_loc_triangle(:,2),uh_local,vertices,basis_type,0,0)));
    if temp>result
        result=temp;
    end
end

