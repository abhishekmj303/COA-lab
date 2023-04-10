module mux_4x1 (out, in0, in1, in2, in3, sel);
    input in0, in1, in2, in3;
    input [1:0] sel;
    output out;
    wire sel0, sel1, sel2, sel3;
    wire out0, out1, out2, out3;
    wire d1, d2;

    // 4x1 mux
    and (sel0, ~sel[1], ~sel[0]);
    and (sel1, ~sel[1], sel[0]);
    and (sel2, sel[1], ~sel[0]);
    and (sel3, sel[1], sel[0]);

    and (out0, in0, sel0);
    and (out1, in1, sel1);
    and (out2, in2, sel2);
    and (out3, in3, sel3);

    or (d1, out0, out1);
    or (d2, out2, out3);
    or (out, d1, d2);
endmodule