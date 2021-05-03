function [I] = Simpson(x, y)
%Numerical evaluation of integral by Simpson's 1/3 Rule
%Inputs:
% x = the vector of equally spaced independent variable (note: must be in
%     ascending order)
% y = the vector of function values with respect to x (dependent variable)
%Outputs:
% I = the numerical integral calculated.
%
% I = Simpsons(x,y)
%
%normally simpsons rule only will work for data sets with an odd number of
%data points. In the case of an even number of data points the simpson's
%rule will be applied until the second to last x value, then generate a
%trapezoid to estimate the integral between the last two remaining points. 

%Error Checking:
%
%First check number of inputs. Must be two (x,y).
if nargin ~= 2
    error('Two inputs required, an independent variable x, then a dependent variable y')
end
%Next determine size of each input. If the inputs are not row vectors, give
%error. If the two vectors are not the same length give an error.
%xl and yl are length of the x and y vectors respectively
[xr,xl]=size(x);
[yr,yl]=size(y);
if yr ~= 1 || xr~= 1
    error('check to see that both x and y are vectors with one row')
elseif xl ~= yl
        error('The length of both x and y vectors must be the same')
elseif xl <= 1
    error('At least 2 points are required for the function to work. With only two points, the trapezoidal rule is used instead')
end
%If for some reason x isn't in ascending order, throw error
if x ~= sort(x)
    error('Rearrange independent variable so it is in ascending order. Adjust dependent variable accordingly.')
end
%Check to see if the x values are evenly spaced. First determine number of segments,
%then determine step size h. Then check to see if the difference between
%pts is h.
seg= (xl-1);
h= ((x(end)-x(1))/seg);
for j=2:xl
    if x(j)-x(j-1) ~= h
        x(j);
        fprintf('Check x at 1,%7.0d for spacing',x(j))
        error('step size of independent variable is not uniform.')
    end
end
% check to see how many segments of the simpson's rule are required. If it
% is odd one iteration of the trapezoidal rule between the 2nd to last and
% last pts of x.
trap=0;
if seg/2 ~= floor(seg/2)
    trap=1;
    disp('There are an even number of data points, therefore the trapezoidal rule was used for the last interval.')
end
%Check number of segments (seg) if only one, use trap rule.
I=0;
if seg == 1
    I= (x(end)-x(1))*((y(end)+y(1))/(2));
    warning('Trapezoid rule applied, need at least 3 data pts for Simpsons 1/3 rule')
%Earlier it was determined if the trapezoidal rule was necessary. If trap =0
%the 1/3 simpsons rule is run normally, using a for loop. Otherwise trap=1,
%meaning that the simpson's rule will stop earlier and require a
%trapezoidal rule for the final segment. 
elseif trap==0
    for k= 2:2:(xl-1)
        I= I+((2*h)/6)*(y(k-1)+4*y(k)+y(k+1));
    end
elseif trap == 1
    for k= 2:2:(xl-2)
       I= I+((2*h)/6)*(y(k-1)+4*y(k)+y(k+1));
    end
    %After simpson's portion is calculated, create a trapazoid using the
    %last 2 remaining points in the dependent (y) vector.
    I=I+(h*((y(yl)+y(yl-1))/2))
    warning('Trapezoid rule applied, an even number of data pts were given, requiring the use of the trapezoid rule to evaluate the integral for the last 2 pts.')
end
    
end
