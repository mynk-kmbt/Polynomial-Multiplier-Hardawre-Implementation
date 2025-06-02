`timescale 1ns / 1ps
    
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

module control_unit(clk,reset, CSR1_load, CSR1_en, CSR2_load, CSR2_en);
    input clk, reset;
    output reg CSR1_load;
    output CSR1_en, CSR2_load, CSR2_en;
    parameter n=4;
    reg [n/2:0] counter;
    reg [n/2:0] counter1;
    
    
    always @ (negedge clk)
    if (reset | (counter1==n && counter==3) )
        begin 
        counter<=0;
        CSR1_load<=1;
        end
    else 
        begin
        CSR1_load<=0;
        if (counter==n-1) counter<=0;
        else counter<=counter+1;
        end
        
    assign CSR2_load = ( counter==1);
    assign CSR2_en = 1'b1;
    assign CSR1_en = (counter==1);
    
    always@(negedge clk)
        if (reset) counter1<=0;
        else
            if (counter1==n && counter==3) counter1<=0;
            else if (counter==1) counter1<=counter1+1'b1;
            else  counter1<=counter1;
        
    

endmodule
