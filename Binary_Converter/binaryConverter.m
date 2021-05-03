%Created by: Brad Portouw Date: Feb 7, 2021
function [base2] = binaryConverter(base10)
%binary A simple function to convert a base10 number to binary
%   Inputs:
%       base10 - A number in base10
%   Outputs:
%       base2 - The base10 number converted to binary
%
% n represents exponent for base 2. n begins at 0 and works up to exponent of
%base 2 that is greater than the value of base10. If base10 is 0, base2=0.
n=0;
if base10 == 0
    base2=zeros(1);
else if base10 <= 0
        error('binaryConverter works on positive intergers only')
    end
    while base10-(2^n) >= 0
        n=n+1;
    end
end
%The value of n is the number of elements in the array, but the value used
%for exponenation is off by 1 as we overshot the value of the base 2 number
%by 1.
if base10 ~= 0
    base2=zeros(1,n);
    col=1;
    n=n-1;
    %With a base2 setup with an array that is n elements long for all elements
    %base2 between 2^n and 2^0, start with 2^n and check to see if the base2
    %Run a for loop starting at n and ending at 0 for 2^n. and check one
    %address at a time in the base2 vector to add either a 1 or a 0.
    
    %Change value of Base2 to 1 if 2^k is less than remaining base10 value,
    %then subtract 2^k from base10 for future loops, then proceed to next
    %column.
    %
    %If value of base 2 is less than value of 2^k, assign 0 to address and move
    %to next column.
    %
    %Process continues until k=0 for last binary element of 2^0.
    for k = n:-1:0
        if (base10-(2^k)) >=0
            base2(col)=1;
            base10=base10-(2^k);
        else
            base2(col)=0;
        end
        col=col+1;
    end
end