`timescale 1ns/1ps

module tb_bcd_adder_8bit;
    // Inputs
    reg [7:0] A;
    reg [7:0] B;

    // Outputs
    wire [7:0] Sum;
    wire Cout;

    // Instantiate the 8-bit BCD Adder module
    bcd_adder_8bit uut (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Waveform dump for GTKWave
        $dumpfile("bcd_adder_8bit.vcd");
        $dumpvars(0, tb_bcd_adder_8bit);

        // Initialize inputs and display header
        $display("Time\tA\t\tB\t\tSum\t\tCout");

        // Test case 1: 12 + 34 = 46 (in BCD)
        A = 8'b0001_0010; // 12
        B = 8'b0011_0100; // 34
        #10;
        $display("%0d\t%8b\t%8b\t%8b\t%b", $time, A, B, Sum, Cout);

        // Test case 2: 45 + 67 = 112 (Cout should be 1)
        A = 8'b0100_0101; // 45
        B = 8'b0110_0111; // 67
        #10;
        $display("%0d\t%8b\t%8b\t%8b\t%b", $time, A, B, Sum, Cout);

        // Test case 3: 99 + 99 = 198 (Cout should be 1)
        A = 8'b1001_1001; // 99
        B = 8'b1001_1001; // 99
        #10;
        $display("%0d\t%8b\t%8b\t%8b\t%b", $time, A, B, Sum, Cout);

        // Test case 4: 50 + 25 = 75
        A = 8'b0101_0000; // 50
        B = 8'b0010_0101; // 25
        #10;
        $display("%0d\t%8b\t%8b\t%8b\t%b", $time, A, B, Sum, Cout);

        // Test case 5: 0 + 0 = 0
        A = 8'b0000_0000; // 0
        B = 8'b0000_0000; // 0
        #10;
        $display("%0d\t%8b\t%8b\t%8b\t%b", $time, A, B, Sum, Cout);

        // Finish simulation
        $stop;
    end
endmodule
