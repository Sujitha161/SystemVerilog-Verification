interface dram #(parameter d_width = 8,depth=8);
  logic clk;
  logic ena,enb;
  logic wea,web;
  logic [d_width-1:0] din_a,din_b;
  logic [$clog2(depth)-1:0] addr_a,addr_b;
  logic [d_width-1:0] dout_a,dout_b;
  assign ena = 1'b1;
  assign enb = 1'b1;

  
  clocking drv_clk @(negedge clk);
    default input #1 output #0;
    output wea,web;
    output din_a,din_b;
    output addr_a,addr_b;
  endclocking
  
  clocking mon_clk @(posedge clk); 
    default input #0 output #0;
    input ena,enb,wea,web;
    input din_a,din_b;
    input addr_a,addr_b;
    input dout_a,dout_b;
  endclocking
  
endinterface
