`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:57:13 08/01/2015 
// Design Name: 
// Module Name:    maquina_7_segmentos 
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
module maquina_7_segmentos(
	 
    input wire [1:0] conteo,
	 input wire [7:0]estado,
	 output wire [7:0] segmentos,
	 output wire [3:0] display
    );
	 reg [11:0] salida;
	 always@* 
	 begin
	      case(conteo)
			2'b00: salida=12'b101100000111;
			2'b01: salida=12'b101010111011;
			2'b10: salida=12'b111111101101;
			2'b11: begin
			       if(estado==8'b10000001)
					 begin
					   salida=12'b100000011110;
			       end
					 
					 else if( estado==8'b11001111) 
				    begin
					   salida=12'b110011111110;
			       end
					 else 
					 begin
					   salida=12'b100100101110;						
			       end
					 end
         endcase 
	end 
	
   assign segmentos= salida[11:4] ;
	assign display=salida[3:0];


endmodule
