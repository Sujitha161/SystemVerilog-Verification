class monitor;
  mailbox m2s;
  virtual fa_int v_int;
  
  function new(mailbox m2s,virtual fa_int v_int);
    this.m2s = m2s;
    this.v_int = v_int;
  endfunction
  
  task run();
    transaction tr;
    repeat(15) begin
      #2;
      tr = new();
      tr.a = v_int.a;
      tr.b = v_int.b;
      tr.cin = v_int.cin;
      tr.sum = v_int.sum;
      tr.carry = v_int.carry;
      m2s.put(tr);
      #10;
    end
  endtask
endclass
      
