function [Gauss_weights_loc_triangle,Gauss_points_loc_triangle]=Gauss_weights_points_loc_triangle(number_of_Gauss_points,vertices_of_triangle)
[Gauss_weights_ref_triangle,Gauss_points_ref_triangle]=Gauss_weights_points_ref_triangle(number_of_Gauss_points);

x1=vertices_of_triangle(1,1);
y1=vertices_of_triangle(2,1);
x2=vertices_of_triangle(1,2);
y2=vertices_of_triangle(2,2);
x3=vertices_of_triangle(1,3);
y3=vertices_of_triangle(2,3);
Jacobi=abs((x2-x1)*(y3-y1)-(x3-x1)*(y2-y1));
Gauss_weights_loc_triangle=Gauss_weights_ref_triangle*Jacobi;
Gauss_points_loc_triangle(:,1)=x1+(x2-x1)*Gauss_points_ref_triangle(:,1)+(x3-x1)*Gauss_points_ref_triangle(:,2);
Gauss_points_loc_triangle(:,2)=y1+(y2-y1)*Gauss_points_ref_triangle(:,1)+(y3-y1)*Gauss_points_ref_triangle(:,2);