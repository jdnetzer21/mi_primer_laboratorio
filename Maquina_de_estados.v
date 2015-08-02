`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:55:54 07/30/2015 
// Design Name: 
// Module Name:    Maquina_de_estados 
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
module Maquina_de_estados(
    input wire CLK,RST,
	 input wire HUMO,TEMP,SOBRECARGA,
	 output reg [7:0]ESTADO_7SEG,
	 output reg EN
    );
	 
wire a;

or Bandera(a,HUMO,TEMP,SOBRECARGA);
	 
//asignaciones de estados 
localparam [1:0]
        INICIO=2'b00,
		  ACT_FF=2'b01,
		  FINAL=2'b10;
		  
reg[2:0] ESTADO_PRESENTE,ESTADO_PROXIMO;

//parte secuecial de la maquina

always@(posedge CLK ,posedge RST)
begin
     if(RST)
	        ESTADO_PRESENTE<=INICIO;
	  else 
	        ESTADO_PRESENTE<=ESTADO_PROXIMO;
end

//Parte combinacion de Cambio de estado 

always@*

	case(ESTADO_PRESENTE)
	
		INICIO:
			if(a)
				ESTADO_PROXIMO=ACT_FF;
				
			else
				ESTADO_PROXIMO=INICIO;
		
		ACT_FF:
			
			ESTADO_PROXIMO=FINAL;
			
		FINAL:
		
			if(~a)
				ESTADO_PROXIMO=INICIO;
				
			else 
				ESTADO_PROXIMO=FINAL;
				
		default:
			ESTADO_PROXIMO=INICIO;
			
	endcase
	
	
///Asignación de salidas


always@(ESTADO_PRESENTE)

		case(ESTADO_PRESENTE)
		
			INICIO:
				begin
				
				EN=1'b0;
				
				ESTADO_7SEG=8'b10000001;
				
				end
			
			ACT_FF:
			
				begin
			
				EN=1'b1;
			
				ESTADO_7SEG=8'b11001111;
					
				end
			
			FINAL:
			
				begin
				
				EN=1'b1;
				
				ESTADO_7SEG=8'b10010010;
				
				end
				
			default:
			
				begin
			
				EN=1'b0;
				
				ESTADO_7SEG=8'b10000001;
				
				end
			endcase

endmodule
