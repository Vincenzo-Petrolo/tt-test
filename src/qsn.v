// `default_nettype none
module tt_um_qsn #(
    localparam LiftingFactor = 4,
    localparam ShiftWidth = 2
) (
	input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  genvar i;
  wire tmp[0:7];

  wire [LiftingFactor-1:0] I;
  wire [LiftingFactor-1:0] O;
  wire [ShiftWidth-1:0] shift;

  assign I = {ui_in[0], ui_in[1], ui_in[2], ui_in[3]};
  assign shift = {ui_in[4], ui_in[5]};
  assign uo_out = {O[0], O[1], O[2], O[3]};

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
