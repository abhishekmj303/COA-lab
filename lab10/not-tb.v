`include "not.v"

module testbench;
    reg a;
    wire out;

    not_v not1(a, out);

    initial begin;
        a = 1'b0;
        #10; a = a + 1;
    end

    initial
        $monitor($time, " : a=%b out=%b", a, out);
endmodule