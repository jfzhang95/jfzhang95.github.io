function [Gauss_weights_ref_triangle,Gauss_points_ref_triangle]=Gauss_weights_points_ref_triangle(number_of_Gauss_points)

if number_of_Gauss_points==3
    Gauss_weights_ref_triangle=[1/6;1/6;1/6];
    Gauss_points_ref_triangle =[1/2,0;1/2,1/2;0,1/2];
elseif number_of_Gauss_points==4
    Gauss_weights_ref_triangle=[(1-1/sqrt(3))/8;(1-1/sqrt(3))/8;(1+1/sqrt(3))/8;(1+1/sqrt(3))/8];
    Gauss_points_ref_triangle=[(1/sqrt(3)+1)/2,(1-1/sqrt(3))*(1+1/sqrt(3))/4;(1/sqrt(3)+1)/2,(1-1/sqrt(3))*(1-1/sqrt(3))/4;(-1/sqrt(3)+1)/2,(1+1/sqrt(3))*(1+1/sqrt(3))/4;(-1/sqrt(3)+1)/2,(1+1/sqrt(3))*(1-1/sqrt(3))/4];

elseif number_of_Gauss_points==9
    Gauss_weights_ref_triangle=[64/81*(1-0)/8;100/324*(1-sqrt(3/5))/8;100/324*(1-sqrt(3/5))/8;100/324*(1+sqrt(3/5))/8;100/324*(1+sqrt(3/5))/8;40/81*(1-0)/8;40/81*(1-0)/8;40/81*(1-sqrt(3/5))/8;40/81*(1+sqrt(3/5))/8];
    Gauss_points_ref_triangle=[(1+0)/2,(1-0)*(1+0)/4;(1+sqrt(3/5))/2,(1-sqrt(3/5))*(1+sqrt(3/5))/4;(1+sqrt(3/5))/2,(1-sqrt(3/5))*(1-sqrt(3/5))/4;(1-sqrt(3/5))/2,(1+sqrt(3/5))*(1+sqrt(3/5))/4;(1-sqrt(3/5))/2,(1+sqrt(3/5))*(1-sqrt(3/5))/4;(1+0)/2,(1-0)*(1+sqrt(3/5))/4;(1+0)/2,(1-0)*(1-sqrt(3/5))/4;(1+sqrt(3/5))/2,(1-sqrt(3/5))*(1+0)/4;(1-sqrt(3/5))/2,(1+sqrt(3/5))*(1+0)/4];
end
