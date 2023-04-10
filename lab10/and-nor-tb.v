`include "and-nor.v"
module testbench;
    reg a, b, c;
    wire out;
    and_nor and_nor1(out, a, b, c);
    initial begin
        a = 1'b0; b = 1'b0; c = 1'b0;
        #10; c = c + 1;
        #10; b = b + 1;
        #10; c = c + 1;
        #10; a = a + 1;
        #10; c = c + 1;
        #10; b = b + 1;
        #10; c = c + 1;
    end
    initial
        $monitor($time, " : a=%b b=%b c=%b out=%b", a, b, c, out);
endmodule