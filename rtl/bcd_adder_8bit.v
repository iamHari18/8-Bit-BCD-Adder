module bcd_adder_8bit (
    input [7:0] A,
    input [7:0] B,
    output [7:0] Sum,
    output Cout
);
    wire carry_out_lsd;


    bcd_adder_4bit BCD_LSD (
        .A(A[3:0]), .B(B[3:0]), .Cin(1'b0),
        .Sum(Sum[3:0]), .Cout(carry_out_lsd)
    );

    bcd_adder_4bit BCD_MSD (
        .A(A[7:4]), .B(B[7:4]), .Cin(carry_out_lsd),
        .Sum(Sum[7:4]), .Cout(Cout)
    );

endmodule
