`timescale 1ns / 1ps

module FPGA_implementation_tb();
    reg man_clk,man_reset;
    reg [15:0] bits;
    wire [15:0] LED; 
    FPGA_Implementation uut (.bits(bits), .man_clk(man_clk), .man_reset(man_reset),.LED(LED));
    

    
    initial
    begin
    
    bits={4'b1,4'b0,4'b1,4'b0};man_clk=0;
    man_reset=1;#1;man_reset=0;#100;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#100;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#100;
    bits={4'd4,4'd3,4'd2,4'd1};#50
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#100;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    man_clk=0;#1;man_clk=1;#1;man_clk=0;#10;
    end
    

endmodule
