
`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module tb_dff;
  bit clk;
  environment env;
  dif vdif();
  
  d_ff dut (.clk(clk),.d(vdif.d),.rst(vdif.rst),.q(vdif.q));
  always #5 begin
    clk = ~clk;
    vdif.clk = clk;
  end
  initial begin
    clk=0; 
    env = new(vdif);
    env.run();
    #1000;
    $finish;
  end
endmodule
