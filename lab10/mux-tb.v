`include "mux.v"
module testbench;
    reg d0, d1, d2, d3;
    reg s1, s0;
    wire out;
    mux m0 (out, d0, d1, d2, d3, s1, s0);
    initial begin
        d0 = 0; d1 = 1; d2 = 1; d3 = 0;
        s1 = 1'b0; s0 = 1'b0;
        #10; s0 = s0 + 1;
        #10; s1 = s1 + 1;
        #10; s0 = s0 + 1;

        #20;
        d0 = 1; d1 = 0; d2 = 0; d3 = 1;
        s1 = 1'b0; s0 = 1'b0;
        #10; s0 = s0 + 1;
        #10; s1 = s1 + 1;
        #10; s0 = s0 + 1;
    end
    initial
        $monitor($time, " : d0 = %b, d1 = %b, d2 = %b, d3 = %b, s1 = %b, s0 = %b, out = %b", d0, d1, d2, d3, s1, s0, out);
endmodule