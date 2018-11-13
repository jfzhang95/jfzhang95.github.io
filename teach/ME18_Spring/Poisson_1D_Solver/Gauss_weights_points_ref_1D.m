function [Gauss_weights_ref_1D,Gauss_points_ref_1D] = Gauss_weights_points_ref_1D(number_of_Gauss_points)

if number_of_Gauss_points == 2
    Gauss_weights_ref_1D = [1,1];
    Gauss_points_ref_1D  = [-sqrt(3)/3,sqrt(3)/3];
elseif number_of_Gauss_points == 4
    Gauss_weights_ref_1D = [ 0.3478548451, 0.6521451549,0.6521451549,0.3478548451];
    Gauss_points_ref_1D  = [-0.8611363116,-0.3399810436,0.3399810436,0.8611363116];     
elseif number_of_Gauss_points == 8
    Gauss_weights_ref_1D = [ 0.1012285363, 0.2223810345, 0.3137066459, 0.3626837834,0.3626837834,0.3137066459,0.2223810345,0.1012285363];
    Gauss_points_ref_1D  = [-0.9602898565,-0.7966664774,-0.5255324099,-0.1834346425,0.1834346425,0.5255324099,0.7966664774,0.9602898565];
end
    
    
    
    