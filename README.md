# Module3_PolyProof

This project is written in solidity language and it uses the polygon mumbai facuet. In this file I will explain you how to create a circuit using the circom programming language that implements any logical gate. 

For the first step, run **npm i** command which will fetch and install all the requires project dependencies listed in the package-lock.json.
For the next step run **npx hardhat circom** which will compile the files and next deploy the code using **npx hardhat run scripts/deploy.ts**. And then write the code for the circuit. The code below is for the circuit which contains one AND gate, one NOT gate and one OR gate. The inputs are give to the AND gate as a and b which yields the result as X. Then the NOT gate is taking input as b and yields the result as Y. And lastly, OR gate is taking input as X and Y and it produce the final output as Q. 

    pragma circom 2.0.0;
    
    /*This circuit template checks that c is the multiplication of a and b.*/  
    
    template Circuit () {  
       // signal inputs
       signal input a;
       signal input b;
    
       // signal from gates
       signal x;
       signal y;
    
       // final signal output
       signal output q;
    
       // component gates used to create custom circuits
       component andGate = AND();
       component notGate = NOT();
       component orGate = OR();
    
       // circuit logic 
       andGate.a <== a;
       andGate.b <== b;
       x <== andGate.out;
    
       notGate.in <== b;
       y <== notGate.out;
    
       orGate.a <== x;
       orGate.b <== y;
       q <== orGate.out;
    
       log("a", a):
       log("b", b);
       log("q", q):
    }
    
    template AND() {
        signal input a;
        signal input b;
        signal output out;
    
        out <== a*b;
    }
    
    template NOT() {
        signal input in;
        signal output out;
    
        out <== 1 + in - 2*in;
    }
    
    template OR() {
        signal input a;
        signal input b;
        signal output out;
    
        out <== a + b - a*b;
    }
    
    component main = Circuit();

Now, this is the code. Let's break it as understand it. Circuit Template for Multiplication Check (README)

This circuit template is designed to check whether the output signal q is the result of the multiplication of input signals a and b. The circuit is implemented using the circom language (version 2.0.0).

Usage

To use this circuit template, you need to create a new file with a .circom extension and copy the contents of the provided circuit template into it. Save the file with a suitable name (e.g., multiplication_check.circom).

Components

This circuit uses three custom component templates: AND, NOT, and OR. These components are defined within the circuit template and allow the creation of custom logic for the multiplication check.

Template: AND

The AND template represents a logical AND gate. It takes two input signals, a and b, and outputs their logical AND in the out signal.

Template: NOT

The NOT template represents a logical NOT gate. It takes a single input signal in and outputs its logical negation in the out signal.

Template: OR

The OR template represents a logical OR gate. It takes two input signals, a and b, and outputs their logical OR in the out signal.

Circuit Logic

The circuit logic for the multiplication check is as follows:

Connect the input signals a and b to the andGate component.
The output of the andGate component is connected to signal x.
Signal b is connected to the notGate component to obtain the negation in signal y.
The output signals x and y are connected to the orGate component.
The output of the orGate component is the final output signal q.
Logging

The circuit includes logging statements that will display the values of signals a, b, and q. The logged information can be helpful for debugging or understanding the behavior of the circuit.

For this project, i have taken a = 0 and b = 1 and it will give the output as 0.

# License 
This project is licensed under the MIT license.
