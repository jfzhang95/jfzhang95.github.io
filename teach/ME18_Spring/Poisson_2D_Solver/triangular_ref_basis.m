function result=triangular_ref_basis(x,y,basis_type,basis_index,derivative_order_x,derivative_order_y)
if basis_type==1
    if derivative_order_x==0 && derivative_order_y==0
        if basis_index==1
            result=1-x-y; 
        elseif basis_index==2
            result=x;
        elseif basis_index==3
            result=y;
        end
    elseif derivative_order_x==1 && derivative_order_y==0
        if basis_index==1
            result=-1;
        elseif basis_index==2
            result=1;
        elseif basis_index==3
            result=0;
        end
    elseif derivative_order_x==0 && derivative_order_y==1
        if basis_index==1
            result=-1;
        elseif basis_index==2
            result=0;
        elseif basis_index==3
            result=1;
        end   
    end
elseif basis_type==2
    if derivative_order_x==0 && derivative_order_y==0
        if basis_index==1
            result=2*x.^2+2*y.^2+4*x.*y-3*x-3*y+1;
        elseif basis_index==2
            result=2*x.^2-x;
        elseif basis_index==3
            result=2*y.^2-y;
        elseif basis_index==4
            result=-4*x.^2-4*x.*y+4*x;
        elseif basis_index==5
            result=4*x.*y;
        elseif basis_index==6
            result=-4*y.^2-4*x.*y+4*y;
        end
    elseif derivative_order_x==1 && derivative_order_y==0
        if basis_index==1
            result=4*x+4*y-3;
        elseif basis_index==2
            result=4*x-1;
        elseif basis_index==3
            result=0;
        elseif basis_index==4
            result=-8*x-4*y+4;
        elseif basis_index==5
            result=4*y;
        elseif basis_index==6
            result=-4*y;
        end
    elseif derivative_order_x==0 && derivative_order_y==1
        if basis_index==1
            result=4*y+4*x-3;
        elseif basis_index==2
            result=0;
        elseif basis_index==3
            result=4*y-1;
        elseif basis_index==4
            result=-4*x;
        elseif basis_index==5
            result=4*x;
        elseif basis_index==6
            result=-8*y-4*x+4;
        end
    elseif derivative_order_x==1 && derivative_order_y==1
        if basis_index==1
            result=4;
        elseif basis_index==2
            result=0;
        elseif basis_index==3
            result=0;
        elseif basis_index==4
            result=-4;
        elseif basis_index==5
            result=4;
        elseif basis_index==6
            result=-4;
        end
    elseif derivative_order_x==2 && derivative_order_y==0
        if basis_index==1
            result=4;
        elseif basis_index==2
            result=4;
        elseif basis_index==3
            result=0;
        elseif basis_index==4
            result=-8;
        elseif basis_index==5
            result=0;
        elseif basis_index==6
            result=0;
        end
    elseif derivative_order_x==0 && derivative_order_y==2
        if basis_index==1
            result=4;
        elseif basis_index==2
            result=0;
        elseif basis_index==3
            result=4;
        elseif basis_index==4
            result=0;
        elseif basis_index==5
            result=0;
        elseif basis_index==6
            result=-8;
        end
    end
    
end