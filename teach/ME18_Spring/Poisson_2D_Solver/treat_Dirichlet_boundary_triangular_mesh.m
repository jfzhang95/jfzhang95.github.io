function [A,b]=treat_Dirichlet_boundary_triangular_mesh(Dirichlet_boundary_function_name,A,b,boundary_nodes,Pb)

number_of_boundary_nodes=size(boundary_nodes,2);
for k=1:number_of_boundary_nodes
    if boundary_nodes(1,k)==-1
        i=boundary_nodes(2,k);
        A(i,:)=0;
        A(i,i)=1;
        b(i,1)=feval(Dirichlet_boundary_function_name,Pb(1,i),Pb(2,i));
    end
end