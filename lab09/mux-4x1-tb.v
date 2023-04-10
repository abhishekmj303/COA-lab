`include "mux-4x1.v"

module top;
    reg in0, in1, in2, in3;
    reg [1:0] sel;
    wire out;

    mux_4x1 mux (out, in0, in1, in2, in3, sel);

    initial begin
        in0 = 1'b0; in1 = 1'b1; in2 = 1'b1; in3 = 1'b0;
        sel = 2'b00;
        #10; sel = 2'b01;
        #10; sel = 2'b10;
        #10; sel = 2'b11;
    end

    initial
        $monitor ($time, " in0=%b in1=%b in2=%b in3=%b sel=%b out=%b", in0, in1, in2, in3, sel, out);
endmodule