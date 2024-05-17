// `default_nettype none
module tt_um_qsn #(
    localparam LiftingFactor = 4,
    localparam ShiftWidth = 2
) (
    input wire [LiftingFactor - 1:0] I,
    input wire [ShiftWidth - 1:0] shift,
    output wire [LiftingFactor - 1:0] O,
    input wire ena,  // always 1 when the design is powered, so you can ignore it
    input wire clk,  // clock
    input wire rst_n  // reset_n - low to reset
);

  genvar i;
  localparam configs_LiftingFactor = 4;
  wire tmp[0:7];

  generate
    for (i = 0; i < configs_LiftingFactor; i = i + 1) begin : gen_replicate
      assign tmp[i] = I[i];
      assign tmp[i+configs_LiftingFactor] = I[i];
    end
    for (i = 0; i < configs_LiftingFactor; i = i + 1) begin : gen_assignOutput
      assign O[i] = tmp[i+shift];
    end
  endgenerate
endmodule
