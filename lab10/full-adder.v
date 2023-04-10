module full_adder(sum,cout,a,b,cin);
    output sum, cout;
    input a, b, cin;
    wire w1,c1,c2;
    half_adder half1(w1, c1, a, b);
    half_adder half2(sum, c2, w1, cin);
    or(cout, c1, c2);
endmodule
module half_adder(sum,cout,a,b);
    output sum, cout;
    input a, b;
    xor(sum, a, b);
    and(cout, a, b);
endmodule
