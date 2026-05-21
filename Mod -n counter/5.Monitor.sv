class monitor #(parameter n = 10);
  mailbox m2s;
  virtual count_if vcount_if;
  
  function new (mailbox m2s,virtual count_if vcount_if);
    this.m2s = m2s;
    this.vcount_if = vcount_if;
  endfunction
  
  task run();
    transaction #(n) tr;
   repeat(20)begin
      tr = new();
      @(vcount_if.mon_clk);
      tr.rst = vcount_if.rst;
      tr.count = vcount_if.count;
      m2s.put(tr);
    end
  endtask
endclass
