function [Gauss_weights_loc_1D,Gauss_points_loc_1D] = Gauss_weights_points_loc_1D(lower_bound,upper_bound,number_of_Gauss_points)

[Gauss_weights_ref_1D,Gauss_points_ref_1D] = Gauss_weights_points_ref_1D(number_of_Gauss_points);

Gauss_weights_loc_1D=(upper_bound-lower_bound)/2*Gauss_weights_ref_1D;
Gauss_points_loc_1D=(upper_bound-lower_bound)/2*Gauss_points_ref_1D+(upper_bound+lower_bound)/2;