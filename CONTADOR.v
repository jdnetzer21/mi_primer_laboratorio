`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:09:32 08/01/2015 
// Design Name: 
// Module Name:    CONTADOR 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CONTADOR
#(parameter N=2)
(clk, rst, valor);
    input  clk, rst;
    output reg [N-1:0] valor;

    reg [N-1:0]  nuevovalor;

    always @(posedge clk , posedge rst)
      if(rst == 1) valor = 0;
      else valor = nuevovalor;

    always @(valor)
      nuevovalor = valor + 2'd1;
  endmodule
