// 1 bit half adder
module half_addr (sum, cout, a, b);
    input a, b;
    output sum, cout;

    xor (sum, a, b);
    and (cout, a, b);
endmodule

// 1 bit full adder
module full_adder (sum, cout, a, b, cin);
    input a, b, cin;
    output sum, cout;
    wire s1, c1, s2, c2;

    half_addr ha_0 (s1, c1, a, b);
    half_addr ha_1 (sum, c2, s1, cin);
    or (cout, c1, c2);
endmodule

// 16 bit full adder
module full_adder_16 (sum, cout, a, b, cin);
    input [15:0] a, b;
    input cin;
    output [15:0] sum;
    output cout;
    wire [15:0] c1;
    
    // loop 16 times to add 16 bits
    genvar i;
    full_adder fa_0 (sum[0], c1[0], a[0], b[0], cin);
    for (i = 1; i < 15; i = i + 1) begin
        full_adder fa_i (sum[i], c1[i], a[i], b[i], c1[i-1]);
    end
    full_adder fa_15 (sum[15], cout, a[15], b[15], c1[14]);
endmodule
