`timescale 1ns/1ps

module Testspinal (
  input               rst,
  input               user_button,
  input               clk,
  output reg [5:0]    leds
);
  always @(negedge rst or negedge user_button) begin
    if(!rst) begin
      leds <= 6'b111110;
    end
    else if(user_button) begin 
      leds <= {leds[4:0], leds[5]};
    end
  end
endmodule
