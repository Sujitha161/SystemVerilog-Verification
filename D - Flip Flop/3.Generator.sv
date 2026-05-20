class generator;
  mailbox mg2d;

  
  function new (mailbox mg2d );
    this.mg2d = mg2d;
  endfunction
  
  task run();
    transaction tr;
    repeat(10)begin
    tr=new();
      if(tr.randomize())
       mg2d.put(tr);
      else
      $display("Randomization failed"); 
      $display("Generator === rst : %0b , d : %0b",tr.rst,tr.d);
    end
    endtask
endclass
