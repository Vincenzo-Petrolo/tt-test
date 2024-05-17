// `default_nettype none
module tt_um_qsn #(
    localparam LiftingFactor = 4,
    localparam ShiftWidth = 2
) (
    I,
    shift,
    O
);
  input wire [LiftingFactor - 1:0] I;
  input wire [ShiftWidth - 1:0] shift;
  output wire [LiftingFactor - 1:0] O;
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
