/*
 * Copyright (c) 2024 Vincenzo Petrolo
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

`ifndef __QSN_SV
`define __QSN_SV


`include "configs.sv"

module qsn
  /*  package imports  */
  import configs::*;
(
    input logic I[LiftingFactor],
    logic [ShiftWidth-1:0] shift,
    output logic O[LiftingFactor]
);

  genvar i;
  logic tmp[2*LiftingFactor];

  generate;
    for (i=0; i<LiftingFactor; i++) begin : gen_replicate
      assign tmp[i] = I[i];
      assign tmp[i+LiftingFactor] = I[i];
    end

    for (i=0; i<LiftingFactor; i++) begin : gen_assignOutput
      assign O[i] = tmp[i+shift];
    end
  endgenerate

endmodule : qsn

`endif