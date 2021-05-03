function [L, U, P] = luFactor(A)
%luFactor will perform L U Decomposition to create Lower Triangular [L],
%upper triagnular [U] and permutation matrix of a given coefficient matrix A.
%
%Inputs:
%   A= coefficient matrix (must be square)
%
%Outputs:
%   L= lower triangular matrix
%   U= upper triangular matrix
%   P= permutation matrix
[M,N]=size(A);
if nargin ~= 1
    error('needs only one input, a square coefficient matrix')
elseif M ~= N
    error('Make sure coefficient matrix is square (rows = columns');
end
%Matrix setup: make a square matrix for U L and P.
U=zeros(M);
L=zeros(M);
P=zeros(M);

%Forward Elimination:
%U matrix always uses 1st row of A matrix after it has pivoted (Ap):
U(1,:)=Ap(1,:);
%L matrix will have a diagonal of 1s
for i=1:M;
    L(i,i)=1;
end
%After that perform forward Elimination:
%for k columns and j rows:
for k= 1:(N-1);
    %Check to see if a pivot needs to occur in the column for every column
    %until the last one. 1:(#columns-1)
    %find the maximum element in column of question. Record its index
    [max,I]=max(abs(A(k:N,k)));
    %Check to see where the maximum's index relates to the pivot element
    %A(k,k)
    max_rel_k= i+k-1
    %if the relative position of the index isn't the pivot element, pivot
    %the maximum element with the pivot element. Otherwise no pivot is
    %performed. Record each pivot in a row of the P matrix.
    if max_rel_k ~= k
        A([k,max_rel_k],:])=A([max_rel_k,k],:);
        P(k,max_rel_k)=1
    else
        P(k,k)=1
    end
    %after the pivot perform forward elimination.
    for j= (k+1):M;
        %generate a factor and record its value in L matrix
        f=(Ap(j,k))/(Ap(k,k));
        L(j,k)= f;
        %Subtract top row*factor from row in question to eliminate Aji.
        U(j,:)=(Ap(j,:)-(Ap(k,:).*f));
    end
    Ap=U;

end
end

