
`timescale 1 ns / 1 ps

module AXI_REG_wrapper #
(
    // Users to add parameters here
    parameter integer AMOUNT_OF_READ_WRITE_REGISTERS = 2,
    parameter integer AMOUNT_OF_READ_REGISTERS = 2,
//    parameter integer CONFIG = 0,

    // User parameters ends
    // Do not modify the parameters beyond this line


    // Parameters of Axi Slave Bus Interface S00_AXI
    integer C_S00_AXI_DATA_WIDTH	= 32,
    integer C_S00_AXI_ADDR_WIDTH	= 16,
    
    parameter integer DEFAULT_AMOUNT_OF_READ_REGISTERS = 6,
                                          
    parameter integer DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS = 4
)
(
    // Users to add ports here
    input wire [C_S00_AXI_DATA_WIDTH*DEFAULT_AMOUNT_OF_READ_REGISTERS-1:0] INPUT_REG,
    output wire [C_S00_AXI_DATA_WIDTH*DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS-1:0] OUTPUT_REG,
    input wire [C_S00_AXI_DATA_WIDTH*AMOUNT_OF_READ_REGISTERS-1:0] EXTRA_INPUT_REG,
    output wire [C_S00_AXI_DATA_WIDTH*AMOUNT_OF_READ_WRITE_REGISTERS-1:0] EXTRA_OUTPUT_REG,


    // User ports ends
    // Do not modify the ports beyond this line


    // Ports of Axi Slave Bus Interface S00_AXI
    input wire  s00_axi_aclk,
    input wire  s00_axi_aresetn,
    input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
    input wire [2 : 0] s00_axi_awprot,
    input wire  s00_axi_awvalid,
    output wire  s00_axi_awready,
    input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
    input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
    input wire  s00_axi_wvalid,
    output wire  s00_axi_wready,
    output wire [1 : 0] s00_axi_bresp,
    output wire  s00_axi_bvalid,
    input wire  s00_axi_bready,
    input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
    input wire [2 : 0] s00_axi_arprot,
    input wire  s00_axi_arvalid,
    output wire  s00_axi_arready,
    output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
    output wire [1 : 0] s00_axi_rresp,
    output wire  s00_axi_rvalid,
    input wire  s00_axi_rready
);
// Instantiation of Axi Bus Interface S00_AXI
AXI_REG # ( 
    .AMOUNT_OF_READ_REGISTERS(AMOUNT_OF_READ_REGISTERS),
    .AMOUNT_OF_READ_WRITE_REGISTERS(AMOUNT_OF_READ_WRITE_REGISTERS),
    .DEFAULT_AMOUNT_OF_READ_REGISTERS(DEFAULT_AMOUNT_OF_READ_REGISTERS),
    .DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS(DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS)
) AXI_REG_inst (
    .OUTPUT_REG(OUTPUT_REG),
    .INPUT_REG(INPUT_REG),
    .EXTRA_OUTPUT_REG(EXTRA_OUTPUT_REG),
    .EXTRA_INPUT_REG(EXTRA_INPUT_REG),
    .S_AXI_ACLK(s00_axi_aclk),
    .S_AXI_ARESETN(s00_axi_aresetn),
    .S_AXI_AWADDR(s00_axi_awaddr),
    .S_AXI_AWPROT(s00_axi_awprot),
    .S_AXI_AWVALID(s00_axi_awvalid),
    .S_AXI_AWREADY(s00_axi_awready),
    .S_AXI_WDATA(s00_axi_wdata),
    .S_AXI_WSTRB(s00_axi_wstrb),
    .S_AXI_WVALID(s00_axi_wvalid),
    .S_AXI_WREADY(s00_axi_wready),
    .S_AXI_BRESP(s00_axi_bresp),
    .S_AXI_BVALID(s00_axi_bvalid),
    .S_AXI_BREADY(s00_axi_bready),
    .S_AXI_ARADDR(s00_axi_araddr),
    .S_AXI_ARPROT(s00_axi_arprot),
    .S_AXI_ARVALID(s00_axi_arvalid),
    .S_AXI_ARREADY(s00_axi_arready),
    .S_AXI_RDATA(s00_axi_rdata),
    .S_AXI_RRESP(s00_axi_rresp),
    .S_AXI_RVALID(s00_axi_rvalid),
    .S_AXI_RREADY(s00_axi_rready)
);

// Add user logic here

// User logic ends

endmodule
