function result=triangular_loc_basis(x,y,vertices,basis_type,basis_index,derivative_order_x,derivative_order_y)

J11=vertices(1,2)-vertices(1,1);
J12=vertices(1,3)-vertices(1,1);
J21=vertices(2,2)-vertices(2,1);
J22=vertices(2,3)-vertices(2,1);
Jdet=J11*J22-J12*J21;

xhat=(J22*(x-vertices(1,1))-J12*(y-vertices(2,1)))/Jdet;
yhat=(J11*(y-vertices(2,1))-J21*(x-vertices(1,1)))/Jdet;

if derivative_order_x==0 && derivative_order_y==0
    result=triangular_ref_basis(xhat,yhat,basis_type,basis_index,0,0);
elseif derivative_order_x==1 && derivative_order_y==0
    result=(triangular_ref_basis(xhat,yhat,basis_type,basis_index,1,0)*J22 ...        
        +   triangular_ref_basis(xhat,yhat,basis_type,basis_index,0,1)*(-J21))/Jdet;
elseif derivative_order_x==0 && derivative_order_y==1
    result=(triangular_ref_basis(xhat,yhat,basis_type,basis_index,1,0)*(-J12)...
        +   triangular_ref_basis(xhat,yhat,basis_type,basis_index,0,1)*J11)/Jdet;
elseif derivative_order_x==1 && derivative_order_y==1
    result=(triangular_ref_basis(xhat,yhat,basis_type,basis_index,2,0)*(-J12*J22) ...
        +   triangular_ref_basis(xhat,yhat,basis_type,basis_index,0,2)*(-J11*J21) ...
        +   triangular_ref_basis(xhat,yhat,basis_type,basis_index,1,1)*(J11*J22+J12*J21))/Jdet;
elseif derivative_order_x==2 && derivative_order_y==0
    result=(triangular_ref_basis(xhat,yhat,basis_type,basis_index,2,0)*J22^2 ...
        +   triangular_ref_basis(xhat,yhat,basis_type,basis_index,0,2)*J21^2 ...
        +   triangular_ref_basis(xhat,yhat,basis_type,basis_index,1,1)*(-2*J21*J22))/Jdet;
elseif derivative_order_x==2 && derivative_order_y==0
    result=(triangular_ref_basis(xhat,yhat,basis_type,basis_index,2,0)*J12^2 ...
        +   triangular_ref_basis(xhat,yhat,basis_type,basis_index,0,2)*J11^2 ...
        +   triangular_ref_basis(xhat,yhat,basis_type,basis_index,1,1)*(-2*J11*J12))/Jdet;    
end
