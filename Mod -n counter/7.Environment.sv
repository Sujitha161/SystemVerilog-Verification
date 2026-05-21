class environment #(parameter n=10);
  generator  g;
  driver  d;
  monitor #(n) m;
  scoreboard #(n)s;
  
  mailbox mg2d;
  mailbox m2s;
  virtual count_if vcount_if;
  
  function new (virtual count_if vcount_if);
    this.vcount_if = vcount_if;
    mg2d = new();
    m2s = new();
    g = new(mg2d);
    d = new(mg2d,vcount_if);
    m = new(m2s,vcount_if);
    s = new(m2s);
  endfunction
  
  task run();
    fork
      g.run();
      d.run();
      m.run();
      s.run();
    join
  endtask
endclass
    
