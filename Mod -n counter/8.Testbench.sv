
`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module tb_count;
  parameter n = 10; 
  bit clk;
  environment #(n)  env;
  count_if #(n) vcount_if();
  
  modncount #(.n(10)) dut (.clk(vcount_if.clk),.rst(vcount_if.rst),.count(vcount_if.count));
  
  always #5     vcount_if.clk = ~ vcount_if.clk;

  initial begin
    vcount_if.clk=0; 
    vcount_if.rst=1;
    #20;
    vcount_if.rst=0;
    env = new(vcount_if);
    env.run();
    #10000;
    $finish;
  end
endmodule
