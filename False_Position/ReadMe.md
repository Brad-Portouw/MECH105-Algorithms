## False Position Function:

falsePosition is a matlab function that uses the false position method to guess the root of f(x) between 2 points.

**function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)

### Inputs:
- **func:** anynomous function of a given independent variable (x). for example fx= @(x) x^3 + 5;
- **xl:** "x lower" or the lower bound of x that the root lies between.
- **xu:** "x upper" the upper bound of x that the root lies between.
  - **Note:** Be sure that a root exists between these two x values otherwise the false position methdod will not work  
- **es** the desired relative error. If no input default is set to 0.0001%.
- **maxit** maximum number of iterations. if no input the default is 200 iterations.
- **varargin**- any additional parameters used by the function.

### Outputs:
- **root** the function's guess of the roots position, xr.
- **fx** the function that was analyzed. (in anonymous form)
- **ea** approximate relative error of the given root.
- **iter** number of iterations performed to reach the root.
