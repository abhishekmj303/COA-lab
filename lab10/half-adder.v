module half_adder_nand(output sum, output carry,input a, input b);
    wire w1;
    xor_nand xor1(sum, a, b);
    nand_v nand1(w1, a, b);
    nand_v nand2(carry, w1, w1);
endmodule

module xor_nand(output out, input a, input b);
    wire w1, w2, w3;
    nand_v nand1(w1, a, b);
    nand_v nand2(w2, a, w1);
    nand_v nand3(w3, b, w1);
    nand_v nand4(out, w2, w3);
endmodule

module nand_v (output out, input a, input b);
    wire w1;
    and (w1, a, b);
    not (out, w1);
endmodule
