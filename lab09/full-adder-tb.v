`include "full-adder.v"

module top;
    reg [15:0] a, b;
    reg cin;
    wire [15:0] sum;
    wire cout;

    full_adder_16 fa_16 (sum, cout, a, b, cin);

    initial begin
        cin = 1'b0;
        a = 16'h0000; b = 16'h1111;
        #10;
        a = 16'h1100; b = 16'h1001;
    end

    initial
        $monitor ($time, " a=%h b=%h cin=%b sum=%h cout=%b", a, b, cin, sum, cout);
endmodule