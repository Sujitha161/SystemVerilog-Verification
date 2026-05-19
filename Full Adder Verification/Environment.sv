class environment;
  generator g;
  driver d;
  monitor m;
  scoreboard s;
  
  mailbox mg2d;
  mailbox m2s;
  virtual fa_int v_int;
  
  function new (virtual fa_int v_int);
    this.v_int = v_int;
    mg2d = new();
    m2s = new();
    g = new(mg2d);
    d = new(mg2d,v_int);
    m = new(m2s,v_int);
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
