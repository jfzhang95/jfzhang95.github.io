function result=FE_solution_triangle(x,y,uh_local,vertices,basis_type,derivative_order_x,derivative_order_y)

result=0;
number_of_local_basis=length(uh_local);
for i=1:number_of_local_basis
    result=result+uh_local(i)*triangular_loc_basis(x,y,vertices,basis_type,i,derivative_order_x,derivative_order_y);
end