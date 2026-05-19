`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
module tb_fa;
  environment env;
  fa_int v_int();
  
  fa dut ( .a(v_int.a),.b(v_int.b),.cin(v_int.cin),.sum(v_int.sum),.carry(v_int.carry));
  
  initial begin
    env = new(v_int);
    env.run();
    #1000;
    $finish;
  end
endmodule
