
`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module tb_dram;
  parameter d_width = 8,depth=8;
  bit clk;
  environment  #(d_width,depth)  env;
  dram  #(d_width,depth) vdram();
  
  dual_port_ram  #(.d_width(8),.depth(8)) dut (.clk(vdram.clk),.ena(vdram.ena),.enb(vdram.enb),.wea(vdram.wea),.web(vdram.web),.din_a(vdram.din_a),.din_b(vdram.din_b),.addr_a(vdram.addr_a),.addr_b(vdram.addr_b),.dout_a(vdram.dout_a),.dout_b(vdram.dout_b));
  
  always #5     vdram.clk = ~ vdram.clk;

  initial begin
    vdram.clk=0; 
    vdram.wea = 1;
    vdram.web = 1;
    env = new(vdram);
    env.run();
    #100;
    $finish;
  end
  initial begin
    $dumpfile("out.vcd");
    $dumpvars(0,tb_dram);
  end
endmodule
