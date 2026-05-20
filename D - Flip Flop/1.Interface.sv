interface dif;
  logic d;
  logic clk;
  logic rst;
  logic q;
  
  clocking drv_clk @(negedge clk);
    default  input #1 output #0;
    output d,rst;
   endclocking
  
   clocking mon_clk @(posedge clk);
     default input #1 output #0;
     input d,rst,q;
   endclocking 
  
endinterface
