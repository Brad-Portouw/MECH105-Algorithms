## Binary Converter Function

binaryConverter is a matlab script that will convert a positive base 10 number into a positive non float binary (base2) number:

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
2. Run a while loop of the function: `while base10-(2^n) >=0; n=n+1`
   - This counts how long the binary number needs to be in bits.
3. If the number isn't 0, the function will then make base2 a vector of all zeros the length of n.
4. A for loop then will check each bit and decide wither or not it will be a 1 or a zero.
   - It will do this by checking the bits number n and raising 2 to the n. If this value is less than the remainder of the input the value is subtracted from the input and a 1 is logged into that bit.
   - This process is repeated for all bits

