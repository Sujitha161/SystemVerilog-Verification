class scoreboard;
  mailbox m2s;
  
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction 
  
  task run();
  transaction tr;
    bit exp_sum;
    bit exp_carry;
    bit act_sum,act_carry;
    repeat(15)begin
      m2s.get(tr);
      exp_sum = tr.a^tr.b^tr.cin;
      exp_carry = (tr.a & tr.b)|(tr.b & tr.cin)|(tr.cin & tr.a);
      act_sum = tr.sum;
      act_carry = tr.carry;
      
      $display("==================================================");
      $display("==============VERIFICATION REPORT ================");
      $display("\n============ INPUT GENERATED ===================");
      $display(" -----------------------------------------------------");
      $display("   A   = %0b", tr.a);
      $display("   B   = %0b", tr.b);
      $display("   Cin = %0b", tr.cin);
      $display("\n======= EXPECTED OUTPUT (REFERENCE MODEL)=========");
      $display(" -----------------------------------------------------");
      $display("   Sum   = %0b", exp_sum);
      $display("   Carry = %0b", exp_carry);
      $display("\n========= ACTUAL OUTPUT (DUT)===================");
      $display(" -----------------------------------------------------");
      $display("   Sum   = %0b", act_sum);
      $display("   Carry = %0b", act_carry);
      $display("\n================== RESULT=====================");
      if( exp_sum == act_sum && exp_carry == act_carry)
        $display(" PASS : DESIGN OUTPUT MATCHES WITH EXPECTED OUTPUT");
      else
        $display(" FAIL : DESIGN OUTPUT MISMATCHES WITH EXPECTED OUTPUT");
      $display("\n==================================================");
    end
  endtask
endclass
      
      
        
        
      
      
    
