class environment;
  generator g;
  driver d;
  monitor m;
  scoreboard s;
  
  mailbox mg2d;
  mailbox m2s;
  virtual dif vdif;
  
  function new (virtual dif vdif);
    this.vdif = vdif;
    mg2d = new();
    m2s = new();
    g = new(mg2d);
    d = new(mg2d,vdif);
    m = new(m2s,vdif);
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
    
