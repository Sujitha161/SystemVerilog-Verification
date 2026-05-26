class environment #(parameter d_width = 8,depth=8);
  generator  #(d_width,depth) g;
  driver  #(d_width,depth) d;
  monitor  #(d_width,depth) m;
  scoreboard  #(d_width,depth)s;
  
  mailbox mg2d;
  mailbox m2s;
  virtual dram vdram;
  
  function new (virtual dram vdram);
    this.vdram = vdram;
    mg2d = new();
    m2s = new();
    g = new(mg2d,vdram);
    d = new(mg2d,vdram);
    m = new(m2s,vdram);
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
    
