`ifndef __DEC_CONFIGS_SV
`define __DEC_CONFIGS_SV


//  Package: ncu_configs
//
package configs;

  //  Group: Parameters
  localparam unsigned LiftingFactor = 4;
  localparam unsigned ShiftWidth = $clog2(LiftingFactor);

endpackage : configs

`endif
