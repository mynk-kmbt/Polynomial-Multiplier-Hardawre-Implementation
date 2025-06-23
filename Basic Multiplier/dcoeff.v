`timescale 1ns / 1ps

module dcoef(clk, reset, start, ddata0, ddata1, ddata2, ddata3, dcoeff);
    input clk, reset,start;
    parameter n=4;
    parameter k=4;
    input [n-1:0] ddata0, ddata1, ddata2, ddata3;
    output [k-1:0] dcoeff;
    
    reg [n-1:0] CSR3_0,CSR3_1,CSR3_2,CSR3_3 ;
    reg en;
    always@(posedge clk, posedge reset) en<=reset?0:(start?1:en);
    always@(posedge clk, posedge reset)
    if (reset)  
        begin
        CSR3_0<=ddata0;
        CSR3_1<=ddata1;
        CSR3_2<=ddata2;
        CSR3_3<=ddata3;
        end
     else if (en)
        begin
        CSR3_0<={CSR3_0[0],CSR3_0[n-1:1]};
        CSR3_1<={CSR3_1[0],CSR3_1[n-1:1]};
        CSR3_2<={CSR3_2[0],CSR3_2[n-1:1]};
        CSR3_3<={CSR3_3[0],CSR3_3[n-1:1]};
        end
             
      assign dcoeff={CSR3_3[0],CSR3_2[0],CSR3_1[0],CSR3_0[0]};
      
endmodule
