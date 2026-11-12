module bcd_adder_4bit (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [4:0] temp_sum;
    wire [4:0] corrected_sum;
    wire carry_correction;

    assign temp_sum = A + B + Cin;
    assign carry_correction = (temp_sum > 9);
    assign corrected_sum = carry_correction ? (temp_sum + 6) : temp_sum;

    assign Sum = corrected_sum[3:0];
    assign Cout = carry_correction | temp_sum[4];

endmodule
