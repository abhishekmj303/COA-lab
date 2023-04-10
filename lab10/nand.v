module nand_v (output out, input a, input b);
    wire w1;
    and (w1, a, b);
    not (out, w1);
endmodule
