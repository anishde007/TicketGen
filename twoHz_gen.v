`timescale 1ns / 1ps

module fast_clk(
    input clk_100MHz,
    input reset,
    output led
    );
    
    reg [24:0] counter_reg = 0; 
    reg clk_out = 0;
    
    always @(posedge clk_100MHz or posedge reset) begin
        if(reset)
            counter_reg <= 0;
        else
            if(counter_reg == 2_999_999) begin
                counter_reg <= 0;
                clk_out <= ~clk_out;
            end
            else
                counter_reg <= counter_reg + 1;
    end
    
    assign clk_2Hz = led;
    
endmodule
