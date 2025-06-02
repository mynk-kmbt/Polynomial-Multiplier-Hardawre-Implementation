`timescale 1ns / 1ps

module control_unit(clk, reset, sign0, sign1, sign2, sign3, hault);
    input clk, reset;
    output reg sign0, sign1, sign2, sign3, hault;
    
    reg [2:0] counter;
    
    always@(posedge clk)
    if (reset) counter<=0;
    else begin
        if (counter!=5) counter<=counter+1;
        else counter<=counter;
        end
    
    always@(*)
    case(counter)
        0:begin
          sign0=0;
          sign1=0;
          sign2=0;
          sign3=0;
          hault=0;
          end
        1:sign0=1;
        2:sign1=1;
        3:sign2=1;
        4:hault=1;
        default : hault=hault;
    endcase

endmodule
