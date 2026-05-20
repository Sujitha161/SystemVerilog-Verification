class scoreboard;
  mailbox m2s;
  
  function new (mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  task run();
    transaction tr;
    bit exp_q;
    bit act_q;
    repeat(10)begin
      m2s.get(tr);
      if(!tr.rst)
        exp_q = 0;
      else
        exp_q = tr.d;
      act_q = tr.q;
      $display("==================================================");
      $display("==============VERIFICATION REPORT ================");
      $display("\n============ INPUT GENERATED ===================");
      $display(" -------------------------------------------------");
      $display("\n D = %0b",tr.d);
      $display("\n rst = %0b",tr.rst);
      $display("\n====== EXPECTED OUTPUT (REFERENCE MODEL)========");
      $display("\n exp_q = %0b",exp_q);
      $display("\n========= ACTUAL OUTPUT (DUT)==================="); 
      $display("\n  act_q = %0b",tr.q);
      $display("\n==================== RESULT=====================");
      if ( act_q == exp_q)
        $display(" ======  PASS : DUT O/P MATCHES EXP O/P ======= ");
      else
        $display("=====  FAIL : DUT O/P MISMATCHES EXP O/P ====== ");
      $display("\n================================================");
      $display("\n================================================");
    end
  endtask
endclass
      
		      
      
      
  
