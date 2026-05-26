class monitor #(parameter d_width = 8,depth=8);
  mailbox m2s;
  virtual dram #(d_width,depth) vdram;
  
  function new (mailbox m2s , virtual dram #(d_width,depth) vdram);
    this.m2s = m2s;
    this.vdram = vdram;
  endfunction
  
  transaction #(d_width,depth) tr;
  
  task run();
    repeat (30) begin
      tr=new();
      @(vdram.mon_clk);
      tr.ena = vdram.mon_clk.ena;
      tr.enb = vdram.mon_clk.enb;
      tr.wea = vdram.mon_clk.wea;
      tr.web = vdram.mon_clk.web;
      tr.din_a = vdram.mon_clk.din_a;
      tr.din_b = vdram.mon_clk.din_b;
      tr.addr_a = vdram.mon_clk.addr_a;
      tr.addr_b = vdram.mon_clk.addr_b;
      tr.dout_a = vdram.mon_clk.dout_a;
      tr.dout_b = vdram.mon_clk.dout_b;
      m2s.put(tr);
      $display("Monitor = time = %0t, wea : %0b , web : %0b , addr_a : %0d , addr_b : %0d , din_a : %0d  , din_b :%0d,dout_a : %0d , dout_b : %0d ",$time,tr.wea,tr.web,tr.addr_a,tr.addr_b,tr.din_a,tr.din_b,tr.dout_a,tr.dout_b);
      
    end
  endtask
endclass


