module xnor_v(output out, input a, input b);
    wire w1, w2, w3, w4;
    not (w1, a);
    not (w2, b);
    and (w3, a, b);
    and (w4, w1, w2);
    or (out, w3, w4);
endmodule
