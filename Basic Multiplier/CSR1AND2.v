`timescale 1ns / 1ps

//`timescale 1ns / 1ps


//module testbench();
//    reg clk, CSR1_load, CSR1_en, CSR2_load, CSR2_en;
//    reg [3:0] data0, data1;
//    wire [1:0] coeff;
//    initial 
//    begin 
//    clk=0;
//    forever #1 clk=~clk;
//    end
    
//    CSR1AND2 uut (.clk(clk), .CSR1_load(CSR1_load), .CSR1_en(CSR1_en), .CSR2_load(CSR2_load), .CSR2_en(CSR2_en), .data0(data0), .data1(data1), .coeff(coeff));
    
//    initial 
//    begin
//    data1={1'b0,1'b0,1'b1,1'b0};data0={1'b1,1'b0,1'b1,1'b0};CSR1_load=1;
//    #2;CSR1_load=0;
//    CSR2_load=1;CSR1_en=1;#2;
//    CSR2_load=0;CSR1_en=0;CSR2_en=1;#6;
//    CSR2_load=1;CSR1_en=1;#2;
//    CSR2_load=0;CSR1_en=0;CSR2_en=1;#6;
//    CSR2_load=1;CSR1_en=1;#2;
//    CSR2_load=0;CSR1_en=0;CSR2_en=1;#6;
//    CSR2_load=1;CSR1_en=1;#2;
//    CSR2_load=0;CSR1_en=0;CSR2_en=1;#6;
//    #1;
//    $finish;
//    end
//endmodule

module CSR1AND2(clk, CSR1_load, CSR1_en, CSR2_load, CSR2_en, data0, data1, coeff);
    input clk,CSR1_load, CSR1_en, CSR2_load, CSR2_en;
    parameter n=4;
    input [n-1:0] data0, data1;
    output [1:0] coeff;
    
    reg [n-1:0] CSR1_0, CSR1_1; 
    reg [n-1:0] CSR2_0, CSR2_1; 
    wire [1:0] SI;
    
    
    assign SI= ~{CSR1_1[0],CSR1_0[0]} + 1'b1 ;
    
    always @(posedge clk)
        if (CSR1_load)  
            begin
            CSR1_0<=data0;
            CSR1_1<=data1;
            end
        else 
            if (CSR1_en)
                begin
                CSR1_0 <= { SI[0] , CSR1_0[n-1:1]};
                CSR1_1 <= { SI[1] , CSR1_1[n-1:1]};
                end                                
            else
                begin
                CSR1_1<=CSR1_1;
                CSR1_0<=CSR1_0;
                end
    
    
    always @(posedge clk)
        if (CSR2_load)  
            begin
            CSR2_0<=CSR1_0;
            CSR2_1<=CSR1_1;
            end
        else 
            if (CSR2_en)
                begin
                CSR2_0 <= {CSR2_0[n-2:0], CSR2_0[n-1]};
                CSR2_1 <= {CSR2_1[n-2:0], CSR2_1[n-1]};
                end                                
            else
                begin
                CSR2_1<=CSR2_1;
                CSR2_0<=CSR2_0;
                end
                
    assign coeff={CSR2_1[n-1],CSR2_0[n-1]};
    
endmodule
