class transaction #(parameter n = 10);
  rand bit rst;
  bit [$clog2(n)-1:0] count;
  constraint rst_c {rst dist { 1:=3, 0:=10};}
endclass 
  
