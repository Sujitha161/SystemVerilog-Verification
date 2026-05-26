class generator #(parameter d_width = 8,depth=8);
   mailbox mg2d; 
  virtual dram #(d_width,depth) vdram;
  
  function new (mailbox mg2d, 
               virtual dram #(d_width,depth) vdram);
    this.mg2d = mg2d;
    this.vdram = vdram;
  endfunction
   
  transaction #(d_width,depth) tr;
  task run();
    repeat (30) begin
      @(negedge vdram.clk);
      tr = new();
      if(tr.randomize())
        mg2d.put(tr);
      else
        $display("Randomization failed"); 
    
    $display("Generator = time = %0t, wea : %0b , web : %0b , addr_a : %0d , addr_b : %0d , din_a : %0d  , din_b :%0d ",$time,tr.wea,tr.web,tr.addr_a,tr.addr_b,tr.din_a,tr.din_b);
    end 
  endtask
endclass
    
