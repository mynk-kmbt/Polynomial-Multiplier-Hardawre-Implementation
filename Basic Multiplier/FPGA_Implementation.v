`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 04:01:50
// Design Name: 
// Module Name: FPGA_Implementation
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


module FPGA_Implementation(input [15:0]bits,input man_clk,man_reset, output reg [15:0] LED);

    reg [4:0] state;
    reg [3:0] data0, data1, ddata0, ddata1, ddata2, ddata3;
    reg reset;

    wire [3:0] ac, out, dcoeff;
    wire [1:0] coeff;
    top_module ints (man_clk, reset, data0, data1, ddata0, ddata1, ddata2, ddata3, coeff, dcoeff,ac,out);

    
    always@(posedge man_clk , posedge man_reset)
    if (man_reset) begin
                   state<=5'h0;
                   LED<=0;
                   reset<=0;
                end                
     else
        case(state)
            5'd0: begin  LED<={16{1'b1}};reset<=0;state<=state+1;reset<=0; end
            5'd1: begin  data0<={bits[12],bits[8],bits[4],bits[0]}; data1<={bits[13],bits[9],bits[5],bits[1]}; state<=state+1; end
            5'd2: begin  ddata3<={bits[15],bits[11],bits[7],bits[3]};ddata2<={bits[14],bits[10],bits[6],bits[2]};ddata1<={bits[13],bits[9],bits[5],bits[1]};ddata0<={bits[12],bits[8],bits[4],bits[0]};state<=state+1;reset<=1; end
            5'd3: begin state<=state+1; reset<=0;end
            5'd4: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd5: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd6: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd7: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd8: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd9: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd10: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd11: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd12: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd13: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd14: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end 
            5'd15: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd16: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd17: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd18: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd19: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd20: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd21: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd22: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd23: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd24: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd25: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd26: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd27: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd28: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd29: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd30: begin  LED<={coeff,dcoeff,ac,out}; state<=state+1; end
            5'd31: begin  LED<={coeff,dcoeff,ac,out}; state<=state; end
            
           endcase
        
endmodule
