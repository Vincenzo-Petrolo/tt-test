// `default_nettype none
module topmodule (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    and_module u0 ( // <--- Your module
        .a(a_x),
        .b(b_x),
        .y(y_x)
    );

    // ! DO NOT TOUCH !
    logic a_x, b_x, y_x;

    assign a_x = ui_in[0];
    assign b_x = ui_in[1];
    assign uo_out[0] = y_x;

    assign uio_out      = '0;
    assign uo_out[7:1]  = '0;
    assign uio_oe       = '0;
endmodule
