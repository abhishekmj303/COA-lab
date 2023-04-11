`include "mux-8ops.v"

module testbench;
    reg cin1, cin2, s2, s1, s0;
    wire [7:0] d;
    wire cout;

    all_ops ops (d, cin1, cin2);
    mux_8x1 mux (cout, d, s2, s1, s0);

    // 0 -> Bitwise AND
    // 1 -> Bitwise XOR
    // 2 -> Bitwise NAND
    // 3 -> Bitwise OR
    // 4 -> Bitwise NOT (for 1st Input)
    // 5 -> Bitwise NOT (for 2nd Input)
    // 6 -> Bitwise NOR
    // 7 -> Bitwise XNOR

    initial begin
        cin1 = 1'b1; cin2 = 1'b0;
        s2 = 1'b0; s1 = 1'b0; s0 = 1'b0;
        #10; s0 = s0 + 1;
        #10; s1 = s1 + 1;
        #10; s0 = s0 + 1;
        #10; s2 = s2 + 1;
        #10; s0 = s0 + 1;
        #10; s1 = s1 + 1;
        #10; s0 = s0 + 1;
    end

    initial
        $monitor($time, " : in1=%b in2=%b S=%b%b%b out=%b", cin1, cin2, s2, s1, s0, cout);
endmodule
