module parity_8(output out1, output out2, input [7:0] a);
    wire [6:0] w;
    genvar i;
    for (i = 0; i < 4; i = i + 1) begin
        xor (w[i], a[i], a[7-i]);
    end
    xor (w[5], w[0], w[1]);
    xor (w[6], w[2], w[3]);
    xor (out1, w[5], w[6]);
    not (out2, out1);
endmodule
