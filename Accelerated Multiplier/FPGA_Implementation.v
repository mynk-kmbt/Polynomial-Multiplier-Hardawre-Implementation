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

    reg [3:0] state;
    reg [3:0] data0, data1, ddata0, ddata1, ddata2, ddata3;
    reg reset;

    wire [3:0] w0,w1,w2,w3;
    top_module ints (man_clk, reset, data0, data1, ddata0, ddata1, ddata2, ddata3, w0, w1, w2, w3);

    
    always@(posedge man_clk , posedge man_reset)
    if (man_reset) begin
                   state<=2'h0;
                   LED<=0;
                   reset<=0;
                end                
     else
        case(state)
            4'd0: begin  LED<={16{1'b1}};reset<=0;state<=state+1;reset<=0; end
            4'd1: begin  data0<={bits[12],bits[8],bits[4],bits[0]}; data1<={bits[13],bits[9],bits[5],bits[1]}; state<=state+1; end
            4'd2: begin  ddata3<={bits[15],bits[11],bits[7],bits[3]};ddata2<={bits[14],bits[10],bits[6],bits[2]};ddata1<={bits[13],bits[9],bits[5],bits[1]};ddata0<={bits[12],bits[8],bits[4],bits[0]};state<=state+1;reset<=1; end
            4'd3: begin state<=state+1; reset<=0;end
            4'd4: begin  LED<={w3,w2,w1,w0}; state<=state+1; end
            4'd5: begin  LED<={w3,w2,w1,w0}; state<=state+1; end
            4'd6: begin  LED<={w3,w2,w1,w0}; state<=state+1; end
            4'd7: begin  LED<={w3,w2,w1,w0}; state<=state+1; end
            4'd8: begin  LED<={w3,w2,w1,w0}; state<=state+1; end
            4'd9: begin  LED<={w3,w2,w1,w0}; state<=state+1; end
            4'd10: begin  LED<={w3,w2,w1,w0}; state<=state+1; end
            4'd11: begin  LED<={w3,w2,w1,w0}; state<=state+1; end
            4'd12: begin  LED<={w3,w2,w1,w0}; state<=12; end
           endcase
        
endmodule
