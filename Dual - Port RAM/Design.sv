
module dual_port_ram 
      #(parameter d_width = 8,depth=8)
	(input clk,ena,enb,wea,web,
	input [d_width-1:0] din_a,din_b,
	input [$clog2(depth)-1:0] addr_a,addr_b,
	output  reg [d_width-1:0] dout_a,dout_b);
reg [d_width-1:0]mem[depth-1:0];
  always @(posedge clk)
  begin
      if (ena)
      begin
  	 if ( wea)
		mem[addr_a] <= din_a;
	  else 
		  dout_a <= mem[addr_a];
  end
       else
	       dout_a <= 0;
       end
 always @(posedge clk)
 begin
	 if (enb)
	 begin
		 if(web)
			  mem[addr_b] <= din_b;
          else
                  dout_b <= mem[addr_b];
  end
  else
	  dout_b <= 0;
  end
endmodule
