class driver #(parameter d_width = 8,depth=8);
  mailbox mg2d;
  virtual dram #(d_width,depth) vdram;
  
  function new (mailbox mg2d , virtual dram #(d_width,depth) vdram);
    this.mg2d = mg2d;
    this.vdram = vdram;
  endfunction
  
  transaction #(d_width,depth) tr;
  
  task run();
    repeat (30) begin
      mg2d.get(tr);
      @(vdram.drv_clk);
     // vdram.drv_clk.ena <= tr.ena;
     // vdram.drv_clk.enb <= tr.enb;
      vdram.drv_clk.wea <= tr.wea;
      vdram.drv_clk.web <= tr.web;
      vdram.drv_clk.din_a <= tr.din_a;
      vdram.drv_clk.din_b <= tr.din_b;
      vdram.drv_clk.addr_a <= tr.addr_a;
      vdram.drv_clk.addr_b <= tr.addr_b;
      $display("Driver = time = %0t, wea : %0b , web : %0b , addr_a : %0d , addr_b : %0d , din_a : %0d  , din_b :%0d ",$time,tr.wea,tr.web,tr.addr_a,tr.addr_b,tr.din_a,tr.din_b);
      
    end
  endtask
endclass
      
      
