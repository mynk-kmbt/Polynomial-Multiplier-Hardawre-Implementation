    `timescale 1ns / 1ps
    
    module top_module(clk, reset, data0, data1, ddata0, ddata1, ddata2, ddata3, w0, w1, w2, w3,signedcoef0, signedcoef1, signedcoef2, signedcoef3);
        input clk, reset;
        input [3:0] data0, data1, ddata0, ddata1, ddata2, ddata3;
        output reg [3:0] w0, w1, w2, w3;
        
        wire [1:0] coef0, coef1, coef2, coef3;
        CSR inst1 (clk, reset, data0, data1, coef0, coef1, coef2, coef3);
        
        wire [3:0] dcoef;
        dCSR inst2 (clk, reset, ddata0, ddata1, ddata2, ddata3, dcoef);
        
        wire hault, sign0, sign1, sign2, sign3;
        control_unit inst3 (clk, reset, sign0, sign1, sign2, sign3, hault);
        
        output [1:0] signedcoef0, signedcoef1, signedcoef2, signedcoef3;
       
        assign signedcoef0=sign0?(~coef0+1):coef0;
        assign signedcoef1=sign1?(~coef1+1):coef1;
        assign signedcoef2=sign2?(~coef2+1):coef2;
        assign signedcoef3=sign3?(~coef3+1):coef3;
            
        always@ (posedge clk, posedge reset)
        if (reset)
            begin
            w0<=0;
            w1<=0;
            w2<=0;
            w3<=0;
            end
         else if (!hault)
            begin
    //        w0<=w0+signedcoef0*dcoef;
    //        w1<=w1+signedcoef1*dcoef;
    //        w2<=w2+signedcoef2*dcoef;
    //        w3<=w3+signedcoef3*dcoef;
    
            w0<=w0+ ({{5{signedcoef0[1]}},signedcoef0[0]}*{dcoef[3],dcoef[3],dcoef}) ;
            w1<=w1+ ({{5{signedcoef1[1]}},signedcoef1[0]}*{dcoef[3],dcoef[3],dcoef}) ;
            w2<=w2+ ({{5{signedcoef2[1]}},signedcoef2[0]}*{dcoef[3],dcoef[3],dcoef});
            w3<=w3+ ({{5{signedcoef3[1]}},signedcoef3[0]}*{dcoef[3],dcoef[3],dcoef}) ;
            end
         else
            begin
            w0<=w0;
            w1<=w1;
            w2<=w2;
            w3<=w3;
            end
            
    endmodule
