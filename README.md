# nodejs-in-matlab

## Description

Convenience function to setup Node.js in MATLAB. 

Downloads (if needed) and adds Node.js to PATH in MATLAB.

Once setup, you can use MATLAB's [system](https://www.mathworks.com/help/matlab/ref/system.html) command to seamlessly execute Node.js programs from within MATLAB and marshall results back into MATLAB using [jsondecode](https://www.mathworks.com/help/matlab/ref/jsondecode.html).

## Usage

```
>> setupNodejs
v8.12.0
Node.js added to system path.

>> !node -v
v8.12.0

>> !node -e 'console.log(2+2)'
4
```

## Examples
See [examples](examples) folder.