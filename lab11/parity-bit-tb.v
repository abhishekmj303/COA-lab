`include "parity-bit.v"

module testbench;
    reg [7:0] cin;
    wire out1, out2;

    parity_8 parity (out1, out2, cin);

    initial begin
        cin = 8'b00000000;
        #10; cin = 8'b00100011;
        #10; cin = 8'b10101001;
        #10; cin = 8'b10111101;
        #10; cin = 8'b11111111;
        #10; cin = 8'b11111110;
        #10; cin = 8'b01010111;
        #10; cin = 8'b00000010;
        #10; cin = 8'b00100100;
    end

    initial
        $monitor($time, " : input=%b even-parity=%b odd-parity=%b", cin, out1, out2);
endmodule