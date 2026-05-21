interface count_if #(parameter n = 10);
  logic clk;
  logic rst;
  logic [$clog2(n)-1:0] count;
 
  clocking drv_clk @(negedge clk);
    default input #1 output #0;
    output rst;
  endclocking
  
  clocking mon_clk @(posedge clk);
    default input #1 output #0;
    input rst,count;
  endclocking
    
endinterface
