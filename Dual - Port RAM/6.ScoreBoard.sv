class scoreboard #(parameter d_width = 8,depth=8);
  mailbox m2s;

  
  function new (mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  bit [d_width-1:0] exp_dout_a,exp_dout_b;
  bit [d_width-1:0] act_dout_a,act_dout_b;
  int test_count,pass_count,fail_count;
  bit [d_width-1:0] ref_mem[depth-1:0];
 
   transaction #(d_width,depth) tr;
  
  task run();
    repeat(30) begin
      m2s.get(tr);
      test_count++;
      if (tr.ena)
      begin
        if ( tr.wea)
          ref_mem[tr.addr_a] = tr.din_a;
	  else 
        exp_dout_a = ref_mem[tr.addr_a];
      end
       else
	       exp_dout_a = 0;
  //----------------
      if (tr.enb)
	 begin
       if(tr.web)
         ref_mem[tr.addr_b] = tr.din_b;
          else
            exp_dout_b = ref_mem[tr.addr_b];
     end
     else
	  exp_dout_b = 0;
      
      act_dout_a = tr.dout_a;
      act_dout_b = tr.dout_b;
      
      $display("==================================================");
      $display("==============VERIFICATION REPORT ================");
      $display("\n============ INPUT GENERATED ===================");
      $display(" ----------------------------------------");
      $display(" | ena = %0b         |      enb= %0b     |",tr.ena,tr.enb );
      $display(" | wea = %0b         |      web= %0b     |",tr.wea,tr.web );
      $display(" | addr_a = %0d      |      addr_b= %0d  |",tr.addr_a,tr.addr_b );
      $display(" | din_a = %0d       |      din_b= %0d   |",tr.din_a,tr.din_b );
      $display(" ----------------------------------------"); 
      $display("\n====== EXPECTED OUTPUT (REFERENCE MODEL)========");
      $display(" ----------------------------------------");
      $display("| exp_dout_a = %0d  |     exp_dout_b=%0d|",exp_dout_a,exp_dout_b);
      $display(" ----------------------------------------");
      $display("\n========= ACTUAL OUTPUT (DUT)==================="); 
      $display(" ----------------------------------------");
      $display("| act_dout_a = %0d  |     act_dout_b=%0d|",act_dout_a,act_dout_b);
      $display(" ----------------------------------------");
      
      $display("\n==================== RESULT=====================");
     
      if ( act_dout_a == exp_dout_a && act_dout_b == exp_dout_b) begin
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
     $display(" ---------------------------------");
     $display("|    	TOTAL TEST CASE : %0d      | ",test_count);
     $display("|    	TOTAL PASS      : %0d      | ",pass_count);
     $display("|    	TOTAL FAIL      : %0d      | ",fail_count);
     $display(" ---------------------------------");
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
