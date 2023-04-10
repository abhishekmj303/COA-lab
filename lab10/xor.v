module xor_v(output out, input a, input b);
    wire w1, w2, w3, w4;
    not (w1, a);
    not (w2, b);
    and (w3, w1, b);
    and (w4, a, w2);
    or (out, w3, w4);
endmodule
