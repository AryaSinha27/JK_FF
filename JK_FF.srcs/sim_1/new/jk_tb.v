`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2024 10:25:38
// Design Name: 
// Module Name: jk_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for JK Flip-Flop
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module jk_tb;
    reg clk, rst_n;
    reg j, k;
    wire q, q_bar;

    // Instantiate JK flip-flop module
    jk_ff jk (.clk(clk), .rst_n(rst_n), .j(j), .k(k), .q(q), .q_bar(q_bar));

    // Clock generation: Toggle clock every 2 units of time
    always #2 clk = ~clk;

    // Initial stimulus
    initial begin
        rst_n = 0;
        clk = 0;
        $display("rst_n=%b ---> q=%b, q_bar=%b", rst_n, q, q_bar);
        #3 rst_n = 1;

        $display("rst_n=%b ---> q=%b, q_bar=%b", rst_n, q, q_bar);

        // Apply different input combinations to the JK Flip-Flop
        drive(2'b00);
        drive(2'b01);
        drive(2'b10);
        drive(2'b11);
        
        #5;
        $finish;  
    end

    // Task to drive JK inputs
    task drive(input reg [1:0] ip);
        begin
            @(posedge clk);  // Wait for the positive edge of the clock
            {j, k} = ip;     // Assign the input values to j and k
            #1;              // Delay to allow changes to propagate
            $display("j=%b, k=%b ---> q=%b, q_bar=%b", j, k, q, q_bar);
        end
    endtask

    // Dump waveform for post-simulation viewing
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1, jk_tb);
    end
endmodule
