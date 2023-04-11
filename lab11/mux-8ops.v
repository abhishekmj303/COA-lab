module all_ops(output [7:0] out, input i1, input i2);
    and (out[0], i1, i2);
    xor (out[1], i1, i2);
    nand (out[2], i1, i2);
    or (out[3], i1, i2);
    not (out[4], i1);
    not (out[5], i2);
    nor (out[6], i1, i2);
    xnor (out[7], i1, i2);
endmodule

module mux_8x1(output out, input [7:0] d, input s2, input s1, input s0);
    wire n2, n1, n0;
    wire [7:0] w;
    
    not (n2, s2);
    not (n1, s1);
    not (n0, s0);

    and_4 a0 (w[0], n2, n1, n0, d[0]);
    and_4 a1 (w[1], n2, n1, s0, d[1]);
    and_4 a2 (w[2], n2, s1, n0, d[2]);
    and_4 a3 (w[3], n2, s1, s0, d[3]);
    and_4 a4 (w[4], s2, n1, n0, d[4]);
    and_4 a5 (w[5], s2, n1, s0, d[5]);
    and_4 a6 (w[6], s2, s1, n0, d[6]);
    and_4 a7 (w[7], s2, s1, s0, d[7]);

    or_8 r0 (out, w);
endmodule

module and_4(output out, input a0, input a1, input a2, input a3);
    wire w1, w2;
    and (w1, a0, a1);
    and (w2, a2, a3);
    and (out, w1, w2);
endmodule

module or_8(output out, input [7:0] a);
    wire [6:0] w;
    genvar i;
    for (i = 0; i < 4; i = i + 1) begin
        or (w[i], a[i], a[7-i]);
    end
    or (w[5], w[0], w[1]);
    or (w[6], w[2], w[3]);
    or (out, w[5], w[6]);
endmodule