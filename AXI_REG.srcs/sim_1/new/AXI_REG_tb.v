`timescale 1ns / 1ps

module AXI_REG_tb;

  // Testbench Parameters
  parameter C_S_AXI_DATA_WIDTH = 32;
  parameter C_S_AXI_ADDR_WIDTH = 16;
  parameter AMOUNT_OF_READ_WRITE_REGISTERS = 13;
  parameter AMOUNT_OF_READ_REGISTERS = 2;
  
                                          
    parameter DEFAULT_AMOUNT_OF_READ_REGISTERS = 12;
                                          
    parameter DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS = 7;                                           

  wire [C_S_AXI_DATA_WIDTH*DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS-1:0] OUTPUT_REG;
  reg [C_S_AXI_DATA_WIDTH*DEFAULT_AMOUNT_OF_READ_REGISTERS-1:0] INPUT_REG;
  wire [C_S_AXI_DATA_WIDTH*AMOUNT_OF_READ_WRITE_REGISTERS-1:0] EXTRA_OUTPUT_REG;
  reg [C_S_AXI_DATA_WIDTH*AMOUNT_OF_READ_REGISTERS-1:0] EXTRA_INPUT_REG;

  // AXI Signals
  reg S_AXI_ACLK;
  reg S_AXI_ARESETN;
  reg [C_S_AXI_ADDR_WIDTH-1:0] S_AXI_AWADDR;
  reg S_AXI_AWVALID;
  wire S_AXI_AWREADY;
  reg [C_S_AXI_DATA_WIDTH-1:0] S_AXI_WDATA;
  reg [C_S_AXI_DATA_WIDTH/8-1:0] S_AXI_WSTRB;
  reg S_AXI_WVALID;
  wire S_AXI_WREADY;
  wire [1:0] S_AXI_BRESP;
  wire S_AXI_BVALID;
  reg S_AXI_BREADY;
  reg [C_S_AXI_ADDR_WIDTH-1:0] S_AXI_ARADDR;
  reg S_AXI_ARVALID;
  wire S_AXI_ARREADY;
  wire [C_S_AXI_DATA_WIDTH-1:0] S_AXI_RDATA;
  wire [1:0] S_AXI_RRESP;
  wire S_AXI_RVALID;
  reg S_AXI_RREADY;

  // Instantiate the Device Under Test (DUT)
  AXI_REG #(
      .AMOUNT_OF_READ_REGISTERS(AMOUNT_OF_READ_REGISTERS),
      .AMOUNT_OF_READ_WRITE_REGISTERS(AMOUNT_OF_READ_WRITE_REGISTERS),
      .DEFAULT_AMOUNT_OF_READ_REGISTERS(DEFAULT_AMOUNT_OF_READ_REGISTERS),
      .DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS(DEFAULT_AMOUNT_OF_READ_WRITE_REGISTERS)
  ) DUT (
      .OUTPUT_REG(OUTPUT_REG),
      .INPUT_REG(INPUT_REG),
      .EXTRA_OUTPUT_REG(EXTRA_OUTPUT_REG),
      .EXTRA_INPUT_REG(EXTRA_INPUT_REG),
      .S_AXI_ACLK(S_AXI_ACLK),
      .S_AXI_ARESETN(S_AXI_ARESETN),
      .S_AXI_AWADDR(S_AXI_AWADDR),
      .S_AXI_AWVALID(S_AXI_AWVALID),
      .S_AXI_AWREADY(S_AXI_AWREADY),
      .S_AXI_WDATA(S_AXI_WDATA),
      .S_AXI_WSTRB(S_AXI_WSTRB),
      .S_AXI_WVALID(S_AXI_WVALID),
      .S_AXI_WREADY(S_AXI_WREADY),
      .S_AXI_BRESP(S_AXI_BRESP),
      .S_AXI_BVALID(S_AXI_BVALID),
      .S_AXI_BREADY(S_AXI_BREADY),
      .S_AXI_ARADDR(S_AXI_ARADDR),
      .S_AXI_ARVALID(S_AXI_ARVALID),
      .S_AXI_ARREADY(S_AXI_ARREADY),
      .S_AXI_RDATA(S_AXI_RDATA),
      .S_AXI_RRESP(S_AXI_RRESP),
      .S_AXI_RVALID(S_AXI_RVALID),
      .S_AXI_RREADY(S_AXI_RREADY)
  );

  // Clock Generation
  initial begin
    S_AXI_ACLK = 0;
    forever #5 S_AXI_ACLK = ~S_AXI_ACLK;  // 100MHz Clock
  end

  // Reset Logic
  initial begin
    S_AXI_ARESETN = 0;
    #100;
    S_AXI_ARESETN = 1;
  end

  // Write Transaction
  task write(input [C_S_AXI_ADDR_WIDTH-1:0] addr, input [C_S_AXI_DATA_WIDTH-1:0] data);
    begin
      wait (!S_AXI_AWREADY && !S_AXI_WREADY);
      S_AXI_AWADDR = addr;
      S_AXI_WDATA = data;
      S_AXI_AWVALID = 1;
      S_AXI_WVALID = 1;
      S_AXI_WSTRB = 4'b1111; // Enable all byte lanes
      wait (S_AXI_AWREADY && S_AXI_WREADY);
      #100
      S_AXI_AWVALID = 0;
      S_AXI_WVALID = 0;
      wait (S_AXI_BVALID);
      S_AXI_BREADY = 1;
      wait (!S_AXI_BVALID);
      #100
      S_AXI_BREADY = 0;
    end
  endtask

  // Read Transaction
  task read(input [C_S_AXI_ADDR_WIDTH-1:0] addr);
    begin
      wait (!S_AXI_ARREADY);
      S_AXI_ARADDR = addr;
      S_AXI_ARVALID = 1;
      wait (S_AXI_ARREADY);
      #100
      S_AXI_ARVALID = 0;
      wait (S_AXI_RVALID);
      #100
      S_AXI_RREADY = 1;
      wait (!S_AXI_RVALID);
      #100
      S_AXI_RREADY = 0;
    end
  endtask

  // Test Sequence
  initial begin
    // Initialize signals
    S_AXI_AWADDR = 0;
    S_AXI_AWVALID = 0;
    S_AXI_WDATA = 0;
    S_AXI_WSTRB = 0;
    S_AXI_WVALID = 0;
    S_AXI_BREADY = 0;
    S_AXI_ARADDR = 0;
    S_AXI_ARVALID = 0;
    S_AXI_RREADY = 0;
    INPUT_REG = 384'hAAAAAAAABBBBBBBBAAAAAAAABBBBBBBBAAAAAAAABBBBBBBBAAAAAAAABBBBBBBBAAAAAAAABBBBBBBBAAAAAAAACCCCCCCC;
    EXTRA_INPUT_REG = 64'hEEEEEEEEFFFFFFFF;

    // Wait for reset deassertion
    wait (S_AXI_ARESETN);

    // Write to writable registers
    write(48, 32'h99999999); // Write to register 1
    write(52, 32'hAAAAAAAA); // Write to register 2
    write(56, 32'hBBBBBBBB); // Write to register 3
    write(60, 32'hCCCCCCCC); // Write to register 4
    write(64, 32'hDDDDDDDD); // Write to register 5
    write(68, 32'hEEEEEEEE); // Write to register 6
    write(72, 32'hFFFFFFFF); // Write to register 7
    write(84, 32'h00000000); // Write to register 1
    write(88, 32'h11111111); // Write to register 2
    write(92, 32'h22222222); // Write to register 3
    write(96, 32'h33333333); // Write to register 4
    write(100, 32'h44444444); // Write to register 5
    write(104, 32'h55555555); // Write to register 6
    write(108, 32'h66666666); // Write to register 7
    write(112, 32'h77777777); // Write to register 8
    write(116, 32'h88888888); // Write to register 9
    write(120, 32'h99999999); // Write to register 10
    write(124, 32'hAAAAAAAA); // Write to register 11
    write(128, 32'hBBBBBBBB); // Write to register 12
    write(132, 32'hCCCCCCCC); // Write to register 13
    // ... Add more writes as needed

    // Read from all registers
    read(0);  // Read from register 1 (read-only)
    read(4);  // Read from register 2 (read-only)
    read(8);  // Read from register 3 (read-only)
    read(12);  // Read from register 4 (read-only)
    read(16);  // Read from register 5 (read-only)
    read(20);  // Read from register 6 (read-only)
    read(24);  // Read from register 7 (read-only)
    read(28);  // Read from register 8 (read-only)
    read(32);  // Read from register 9 (read-only)
    read(36);  // Read from register 10 (read-only)
    read(40);  // Read from register 11 (read-only)
    read(44);  // Read from register 12 (read-only)
    read(48);  // Read from register 1
    read(52);  // Read from register 2
    read(56);  // Read from register 3
    read(60);  // Read from register 4
    read(64);  // Read from register 5
    read(68);  // Read from register 6
    read(72);  // Read from register 7
    read(76);  // Read from register 1 (read-only)
    read(80);  // Read from register 2 (read-only)
    read(84);  // Read from register 1
    read(88);  // Read from register 2
    read(92);  // Read from register 3
    read(96);  // Read from register 4
    read(100);  // Read from register 5
    read(104);  // Read from register 6
    read(108);  // Read from register 7
    read(112);  // Read from register 8
    read(116);  // Read from register 9
    read(120);  // Read from register 10
    read(124);  // Read from register 11
    read(128);  // Read from register 12
    read(132);  // Read from register 13
    // ... Add more reads as needed

    // Add any additional test scenarios here

    // End simulation
    #1000;
    $finish;
  end

endmodule
