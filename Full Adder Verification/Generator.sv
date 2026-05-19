class generator;
  mailbox mg2d;
 
  function new (mailbox mg2d);
    this.mg2d = mg2d;
  endfunction
  
  task run();
    transaction tr;
    repeat (15)begin
    tr=new();
      if(!tr.randomize())
        $display("Randomization failed");
       mg2d.put(tr);
    end
    endtask
endclass
