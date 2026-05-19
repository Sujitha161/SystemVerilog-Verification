class driver;
  mailbox mg2d;
  virtual fa_int v_int;
  
  function new(mailbox mg2d,virtual fa_int v_int);
    this.mg2d = mg2d;
    this.v_int = v_int;
  endfunction
  
  task run();
    transaction tr;
    repeat(15)begin
      mg2d.get(tr);
      v_int.a = tr.a;
      v_int.b = tr.b;
      v_int.cin = tr.cin;
      #10;
    end
  endtask
endclass
  
