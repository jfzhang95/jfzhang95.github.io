function [solution_2D,maxerror]=get_2D_solution_and_maximum_error(solution_1D,N1_basis,N2_basis,left,bottom,h_basis)

maxerror=0;
solution_2D=zeros(N2_basis+1,N1_basis+1);
for i=1:N1_basis+1
    for j=1:N2_basis+1
        solution_2D(j,i)=solution_1D((i-1)*(N2_basis+1)+j);
        temp=solution_2D(j,i)-exact_solution(left+(i-1)*h_basis(1),bottom+(j-1)*h_basis(2));
        if abs(maxerror)<abs(temp)
            maxerror=temp;
        end
    end
end