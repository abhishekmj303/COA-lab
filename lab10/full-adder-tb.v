`include "full-adder.v"
module testbench;
    reg a, b, cin;
    wire sum, cout;
    full_adder full_adder1(sum, cout, a, b, cin);
    initial begin
        a = 1'b0; b = 1'b0; cin = 1'b0;
        #10; cin = cin + 1;
        #10; b = b + 1;
        #10; cin = cin + 1;
        #10; a = a + 1;
        #10; cin = cin + 1;
        #10; b = b + 1;
        #10; cin = cin + 1;
    end
    initial
        $monitor($time," a=%b b=%b carry_in=%b sum=%b carry_out=%b", a, b, cin, sum, cout);
endmodule