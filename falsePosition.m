% Created by: Brad Portouw Date: Mar 1, 2021
%falsPosition will perform the false position method to estimate the root
%of a function f(x) by bracketing a root between 2 bounds of x.
%
%The inputs are as follows:
%
%falsePosition(function, xl, xu, es, max iterations, varargin)
%function - user given anonymous function of x.
%xl - position of x bracketing the root on the left side.
%xu - position of x bracketing the root on the right side.
%es - the desired relative error (if no user input default to 0.0001%)
%maxit- maximum number of iterations performed (if no input default to 200)
%varargin- any additional parameters used by the function.
%
%Outputs:
%[root, fx, ea, iter]
%root is the function's guess of the roots position, xr.
%fx is the function that was analyzed.
%ea- approximate relative error of the given root.
%iter- number of iterations performed to reach root. 
function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)

%% Script of Function
%First check number of inputs. If there are too many or few inputs, give an
%error. If es or maxit are not specified set to default values. es is in %.
if nargin < 3;
    error('include at least 3 inputs: (function, xlower, xupper)')
elseif nargin > 6;
        error('too many inputs. falsePosition(f(x), xlower, xupper, relative error, maximum iterations, aditional parameters')
elseif nargin == 3;
    es=0.0001;
    maxit= 200;
elseif nargin == 4;
    maxit=200;
end
%
%next check to make sure inputs make sense. xl must be less than xu, and es
%and maxit are positive non zero values. Also check for infinity and
%round up maxit if it is a non interger.
if xl >= xu
    error('xl, the lower bound, must be a smaller value of x than xu');
elseif abs(xl)==inf || abs(xu)==inf
    error('either xl or xu reached infinity')
elseif es <=0;
    error('need a positive non-zero input for realtive error in %')
elseif maxit <= 0
    error('max number of iterations needs to be greater than 0')
elseif maxit == inf || maxit >= 10000
    error('number of iterations too high, please keep below 10000')
elseif maxit ~= floor(maxit);
    maxit=ceil(maxit);
end
%next perform false position using the function given.
%keep running for max iterations or until root is determined.
for k=1:maxit
    if func(xl)*func(xu) >= 0
        error('Problem with bounds, either no root exists between values or multiple roots exist')
    end
    xr= xu -((func(xu).*(xl-xu))./(func(xl)-func(xu)));
    if k == 1
        ea="undefined";
        if func(xr)==0
            root=xr;
            break;
        end
    else
        ea=abs((xr-xp)./(xr))*100;
        if ea<=es
            root=xr;
            break
        end
    end
    if func(xr)*func(xl) < 0
        xu=xr;
    elseif func(xr)*func(xu) < 0
        xl=xr;
    end
    xp=xr;
end
root=xr;
fx=func(xr);
ea;
iter=k;
end

