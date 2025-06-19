`timescale 1ns / 1ps

module CSR(clk, reset, data0, data1, coef0, coef1, coef2, coef3);
    input clk, reset;
    parameter n=4;
    input [n-1:0] data0, data1;
    
    reg [n-1:0] CSR0,CSR1;
    always@(posedge clk,posedge reset)
    if (reset) 
        begin
            CSR0<=data0;
            CSR1<=data1;
        end
    else
        begin
            CSR0<={CSR0[n-2:0],CSR0[n-1]};
            CSR1<={CSR1[n-2:0],CSR1[n-1]};
        end
     
    output [1:0] coef0, coef1, coef2, coef3;
    
    assign coef0={CSR1[0],CSR0[0]};
    assign coef1={CSR1[1],CSR0[1]};
    assign coef2={CSR1[2],CSR0[2]};
    assign coef3={CSR1[3],CSR0[3]};  
    
        
    
endmodule
