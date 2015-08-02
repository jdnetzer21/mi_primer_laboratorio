`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: instituto tecnologico de Costa Rica
// Engineer: Edgar José Campos Duarte, José Daniel Netzer Hernandez
// 
// Create Date:    22:55:01 08/01/2015 
// Design Name: 
// Module Name:    modulo_de_control_de_7segmentos 
// Project Name: primer proyecto de lab de digitales 
// Target Devices: 
// Tool versions: 2
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module modulo_de_control_de_7segmentos(
    input wire CLK_MAQ,CLK_CONT,RST,HUMO,TEMP,SOBRECARGA,
	 output wire [7:0]SEGMENTOS, 
	 output wire [3:0]DISPLAY , 
	 output wire EN 
    );
	 wire [7:0]ESTADO_7SEG;
	 wire [1:0] valor;
	 // Instantiate the module
Maquina_de_estados MAQUINA_E (
    .CLK(CLK_MAQ), 
    .RST(RST), 
    .HUMO(HUMO), 
    .TEMP(TEMP), 
    .SOBRECARGA(SOBRECARGA), 
    .ESTADO_7SEG(ESTADO_7SEG), 
    .EN(EN)
    );
// Instantiate the module
CONTADOR CONTEO (
    .clk(CLK_CONT), 
    .rst(RST), 
    .valor(valor)
    );


// Instantiate the module
maquina_7_segmentos SEGMENTOS_2 (
    .conteo(valor), 
    .estado(ESTADO_7SEG), 
    .segmentos(SEGMENTOS), 
    .display(DISPLAY)
    );



endmodule
