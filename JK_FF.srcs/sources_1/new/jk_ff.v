`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2024 10:00:52
// Design Name: 
// Module Name: jk_ff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module jk_ff(
  input clk,rst_n,
  input j,k,
  output reg q,
  output q_bar
    );
    
    always@(posedge clk) begin
    if(!rst_n) q<=0;
    else begin
      case({j,k}) 
      2'b00: q <= q;
      2'b01: q<= 0;
      2'b10: q<=1;
      2'b11: q<=~q;
      endcase
      end
      end
      assign q_bar=~q;
     
      
endmodule
