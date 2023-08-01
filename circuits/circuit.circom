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