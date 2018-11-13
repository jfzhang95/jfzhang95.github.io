function [P,T]=generate_P_T_triangular_mesh(left,right,bottom,top,h_mesh,basis_type)
% Generate the matrix P and T for a triangular mesh of a rectangular domain
% [left,right]*[bottom,top].
%% h_mesh  -- the step size of the partition.
%   We first form a rectangular mesh with element size h_mesh(1)*h_mesh(2). 
%   The triangular mesh is formed by cutting each rectangle into two 
%   triangles along the diagonal line from left-top vertex to the 
%   right-bottom vertex.
% basis_type    -- the type of the FE.
%           =1  -- 2D linear FE.
%           =2  -- 2D Lagrange quadratic FE.
%
%% P stores the coordinates of all nodes for the type of finite element 
%   specified by "basis_type".
%   P(i,j) is the ith coordinate of the jth node.
%
%% T stores the global indices of the nodes of every element for the type 
%   of finite element specified by "basis_type".
%   T(i,j) stores the global index of the ith node in th jth element.

h=h_mesh;

if basis_type==1

   N1=(right-left)/h(1);
   N2=(top-bottom)/h(2);
   number_of_FE_nodes=(N1+1)*(N2+1);
   number_of_elements=2*N1*N2;
   P=zeros(2,number_of_FE_nodes);
   T=zeros(3,number_of_elements);
   Q=zeros(N1+1,N2+1);
   
   for j=1:number_of_FE_nodes
      if mod(j,N2+1)==0
         P(1,j)=left+(j/(N2+1)-1)*h(1);
         P(2,j)=top;
      else
         P(1,j)=left+fix(j/(N2+1))*h(1);
         P(2,j)=bottom+(mod(j,N2+1)-1)*h(2);
      end
   end

   for i=1:N1+1
      for j=1:N2+1
         Q(i,j)=(i-1)*(N2+1)+j;
      end
   end

%Go through all rectangles in the partition. 
%For the nth rectangle, store the information of its two triangular elements whose element indices are 2n-1 and 2n.
   for n=1:N1*N2
   
      if mod(n,N2)==0
         row=N2;
         column=n/N2;
      else
         row=mod(n,N2);
         column=fix(n/N2)+1;
      end
   
      T(1,2*n-1)=Q(column,row);
      T(2,2*n-1)=Q(column+1,row);
      T(3,2*n-1)=Q(column,row+1);  
  
      T(1,2*n)=Q(column,row+1);
      T(2,2*n)=Q(column+1,row);
      T(3,2*n)=Q(column+1,row+1);  
    
   end

elseif basis_type==2

   N1=(right-left)/h(1);
   N2=(top-bottom)/h(2);
   dh=h/2;
   dN1=N1*2;
   dN2=N2*2;
   number_of_FE_nodes=(dN1+1)*(dN2+1);
   number_of_elements=2*N1*N2;
   P=zeros(2,number_of_FE_nodes);
   T=zeros(3,number_of_elements);
   Q=zeros(dN1+1,dN2+1);

   for j=1:number_of_FE_nodes
      if mod(j,dN2+1)==0
         P(1,j)=left+(j/(dN2+1)-1)*dh(1);
         P(2,j)=top;
      else
         P(1,j)=left+fix(j/(dN2+1))*dh(1);
         P(2,j)=bottom+(mod(j,dN2+1)-1)*dh(2);
      end
   end

   for i=1:dN1+1
      for j=1:dN2+1
         Q(i,j)=(i-1)*(dN2+1)+j;
      end
   end

%Go through all rectangles in the partition. 
%For the nth rectangle, store the information of its two triangular elements whose element indices are 2n-1 and 2n.
   for n=1:N1*N2
   
      if mod(n,N2)==0
         row=N2;
         column=n/N2;
      else
         row=mod(n,N2);
         column=fix(n/N2)+1;
      end
   
      T(1,2*n-1)=Q(2*column-1,2*row-1);
      T(2,2*n-1)=Q(2*column+1,2*row-1); 
      T(3,2*n-1)=Q(2*column-1,2*row+1);
      T(4,2*n-1)=Q(2*column,2*row-1);
      T(5,2*n-1)=Q(2*column,2*row);
      T(6,2*n-1)=Q(2*column-1,2*row);


      T(1,2*n)=Q(2*column-1,2*row+1);
      T(2,2*n)=Q(2*column+1,2*row-1);
      T(3,2*n)=Q(2*column+1,2*row+1);
      T(4,2*n)=Q(2*column,2*row);
      T(5,2*n)=Q(2*column+1,2*row);
      T(6,2*n)=Q(2*column,2*row+1); 

   end
end