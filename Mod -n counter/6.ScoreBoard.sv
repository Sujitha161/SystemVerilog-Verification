class scoreboard #(parameter n = 10);
  mailbox m2s;
  
  
  function new (mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  transaction #(n) tr;
  
    bit [$clog2(n)-1:0] exp_count;
    bit [$clog2(n)-1:0] act_count;
  
    int test_count,pass_count,fail_count;
 
  
  task run();
   repeat(20)begin
      m2s.get(tr);
      test_count++;
      if(tr.rst)
        exp_count = 4'b0000;
      else if (exp_count == n-1)
        exp_count = 4'b0000;
      else
        exp_count = exp_count + 1;
      
      act_count=tr.count;
      
      $display("==================================================");
      $display("==============VERIFICATION REPORT ================");
      $display("\n============ INPUT GENERATED ===================");
      $display("\n rst = %0b",tr.rst);
      $display("\n====== EXPECTED OUTPUT (REFERENCE MODEL)========");
      $display("\n exp_count = %4b",exp_count);
      
      $display("\n========= ACTUAL OUTPUT (DUT)==================="); 
      $display("\n  act_count = %4b",act_count);
      
      $display("\n==================== RESULT=====================");
      if ( act_count == exp_count) begin
        $display(" ======  PASS : DUT O/P MATCHES EXP O/P ======= ");
        pass_count++;
      end
      else
        begin
        $display("=====  FAIL : DUT O/P MISMATCHES EXP O/P ====== ");
        fail_count++;
       end
    end
      $display("================================================");
      $display("============== FINAL REPORT ====================");
      $display("================================================");
      $display(" --------------------------------");
      $display("|    	TOTAL TEST CASE : %0d     | ",test_count);
      $display("|    	TOTAL PASS      : %0d     | ",pass_count);
      $display("|    	TOTAL FAIL      : %0d     | ",fail_count);
      $display(" --------------------------------");
      $display("================================================");
      $display("============== FINAL STATUS ====================");
      $display("================================================");
      if ( fail_count == 0 )
        $display("     ALL THE TEST CASE ARE PASSS ");
      else
        $display("     FAIL OCCURED    ");
      $display("================================================");
      $display("================================================");
      $display("================================================");
    
  endtask     
endclass
        
      
      
      
