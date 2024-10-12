`timescale 1ns / 1ps

module led_driver(
    input clk,      // 2Hz
    output [15:0] LED
    );
    reg [15:0] scheme1 = 16'b0000000000000000;
    reg [2:0]b = 3'b000;
    integer i;
    parameter max = 15;
//    reg [15:0] scheme2 = 16'b1000000000000001;
always @(posedge clk)
begin
 b<=b+1;
//end
//begin   

        scheme1[b] <= ~scheme1[b];
        scheme1[max - b] <= ~scheme1[max-b];
//    end
end
        assign LED = scheme1;
endmodule
