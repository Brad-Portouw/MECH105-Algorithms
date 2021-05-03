## binaryConverter(base10)

binaryConverter is a matlab script that will convert a positive base 10 number into a binary (base2) number:

**function [base2] = binaryConverter(base10)**

### Inputs:
    
-  Base10 - a number in base10

### Outputs:

- base2 - a number in base 2
  -**NOTE: This isn't a floating point number**
### Function Proceedure:

1. Checks to see if input is either 0 or negative
   - If 0 base2=0
   - If neg throws error
2. Run a while loop of the function: 'base10-(2^n) >=0; n=n+1'

