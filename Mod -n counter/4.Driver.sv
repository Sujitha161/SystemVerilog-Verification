class driver ;
  mailbox mg2d;
  virtual count_if vcount_if;
  
  function new (mailbox mg2d,virtual count_if vcount_if);
    this.mg2d = mg2d;
    this.vcount_if = vcount_if;
  endfunction
  
  task run();
    
    transaction  tr;
    repeat(20)begin
      mg2d.get(tr);
      @(vcount_if.drv_clk);
      vcount_if.rst <= tr.rst;
    end
  endtask
endclass
