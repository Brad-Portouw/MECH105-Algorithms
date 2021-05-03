## False Position Function:

falsePosition is a matlab function that uses the false position method to guess the root of f(x) between 2 points.

**function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)

### Inputs:
- **func:** anynomous function of a given independent variable (x). for example fx= @(x) x^3 + 5;
- **xl:** "x lower" or the lower bound of x that the root lies between.
- **xu:** "x upper" the upper bound of x that the root lies between.
     ***Note: Be sure that a root exists between these two x values otherwise the false position methdod will not work***  
    
