`include "nor.v"
module testbench;
    reg a, b;
    wire out;
    nor_v nor1(out, a, b);
    initial begin;
        a = 1'b0; b = 1'b0;
        #10; b = b + 1;
        #10; a = a + 1;
        #10; b = b + 1;
    end
    initial
        $monitor($time, " : a=%b b=%b out=%b", a, b, out);
endmodule