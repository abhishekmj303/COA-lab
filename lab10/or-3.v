module or_3(output out, input b, input c, input d);
    wire w1;
    or (w1, b, c);
    or (out, w1, d);
endmodule
