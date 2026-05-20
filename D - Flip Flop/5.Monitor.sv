class monitor;
  mailbox m2s;
  virtual dif vdif;
  
  function new (mailbox m2s, virtual dif vdif);
    this.m2s = m2s;
    this.vdif = vdif;
  endfunction
  
  task run();
    transaction tr;
    repeat(10)begin
      tr = new();
      @(vdif.mon_clk)
      tr.d = vdif.d;
      tr.rst = vdif.rst;
      tr.q = vdif.q;
      m2s.put(tr);
      $display("monitor === rst : %0b , q : %0b , d : %0b",tr.rst,tr.q,tr.d);
    end
  endtask
endclass
