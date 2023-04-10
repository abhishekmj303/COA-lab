`include "half-adder.v"
module testbench;
    reg a, b;
    wire sum, carry;
    half_adder_nand half_adder1(sum, carry, a, b);
    initial begin
        a = 1'b0; b = 1'b0;
        #10; b = b + 1;
        #10; a = a + 1;
        #10; b = b + 1;
    end
    initial
        $monitor($time, " : a=%b b=%b sum=%b carry=%b", a, b, sum, carry);
endmodule