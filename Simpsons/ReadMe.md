## Simpson's 1/3 rule Function

Simpson is a matlab function that will perform numerical integration with the composite Simpson's 1/3 rule by comparing a vector of independent variables (x) to dependent variables (y).

**[I] = Simpson(x,y)**

### Inputs:
- **x:** an evenly spaced vector of the independent variable. **note: must be in ascending order**
- **y:** the vector of dependent variables with respect to the given independent variable x. Must be the same length of the first input.
  - **Note: Simpson's 1/3 rule works best when there are an odd number of data points. If an even number is given the trapezoid rule is used to integrate the last section.**

### Outputs:
- **I:** the numerical integral calculated.
  - If an even number of data points are integrated, a note will appear telling the user that the trapezoid rule was used for the last 2 points.


