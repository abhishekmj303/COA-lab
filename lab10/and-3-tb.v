`include "and-3.v"

module testbench;
    reg b,c,d;
    wire out;

    and_3 and3(out,b,c,d);

    initial begin;
        b = 1'b0; c = 1'b0; d = 1'b0;
        #10; d = d + 1;
        #10; c = c + 1;
        #10; d = d + 1;
        #10; b = b + 1;
        #10; d = d + 1;
        #10; c = c + 1;
        #10; d = d + 1;
    end

    initial
        $monitor($time, " : b=%b c=%b d=%b out=%b", b, c, d, out);
endmodule