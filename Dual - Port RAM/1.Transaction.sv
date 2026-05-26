class transaction  #(parameter d_width = 8,depth=8);
  bit ena,enb;
  rand bit wea,web;
  randc bit [d_width-1:0] din_a,din_b;
  rand bit [$clog2(depth)-1:0] addr_a,addr_b;
  bit [d_width-1:0] dout_a,dout_b;
  
  constraint normal_c {
    wea dist { 1:=10,0:=4};
    web dist { 1:=10,0:=4};
                       }
                       
  constraint addr_c {
                       addr_a > 0 ;
      				   addr_b > 0;	
                      !(wea && web && (addr_a == addr_b));
                       }
endclass
