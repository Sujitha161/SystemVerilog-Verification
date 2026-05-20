class driver;
  mailbox mg2d;
  virtual dif vdif;
  
  function new (mailbox mg2d, virtual dif vdif);
    this.mg2d = mg2d;
    this.vdif = vdif;
  endfunction
  
  task run();
    transaction tr;
    repeat(10)begin
      mg2d.get(tr);
      @(vdif.drv_clk);
      vdif.drv_clk.rst <= tr.rst;
      vdif.drv_clk.d <= tr.d;
      $display("driver === rst : %0b , d : %0b",tr.rst,tr.d);
      #10;
    end
  endtask
endclass
