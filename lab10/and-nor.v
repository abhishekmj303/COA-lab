module and_nor(output out, input a, input b, input c);
    wire w1, w2, w3, w4, w5;
    nor_v nor1(w1, a, a);
    nor_v nor2(w2, b, b);
    nor_v nor3(w3, w1, w2);
    nor_v nor4(w4, w3, w3);
    nor_v nor5(w5, c, c);
    nor_v nor6(out, w4, w5);
endmodule

module nor_v (output out, input a, input b);
    wire w1;
    or (w1, a, b);
    not (out, w1);
endmodule
