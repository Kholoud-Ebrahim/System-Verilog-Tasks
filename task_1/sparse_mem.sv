module sparse_mem();
  //define the boolean data type
  typedef enum{FALSE, TRUE} boolean_t;
  boolean_t bool;
  //define the 32 unsigned bit data type 
  typedef bit[31:0] unsigned_32bit_t;
  //declare the big_mem associative array 
  boolean_t big_mem [unsigned_32bit_t];
  //to get the required inside it
  unsigned_32bit_t Result[$],out[$];
  
  initial begin
    //write to big_mem using loops
    repeat(25) begin
      big_mem[$urandom()]= bool;
    end 
    $display("======================== 1 ===========================");
    $display("Before Editing:\nbig_mem = ",big_mem);
    $display("======================== 2 ===========================");
    foreach(big_mem[i])
      big_mem[i]= TRUE;
    $display("After Editing:\nbig_mem = ",big_mem);
    $display("======================== 3 ===========================");

    //Display the following information about big_mem:
    //How many entries it has with the value TRUE
    Result=big_mem.find_index with (item==TRUE);
    $display("Number of entries with value TRUE= %0d",Result.size);
    $display("======================== 4 ===========================");
    
    //What is the smallest index with the value TRUE
    out=Result.min;
    $display("The smallest index with value TRUE= %0d",out[0]);
    out.delete;
    $display("======================== 5 ===========================");
    //What is the largest index with the value TRUE
    out=Result.max;
    $display("The largest index with value TRUE = %0d",out[0]);
    $display("======================== 6 ===========================");
    //The index value of all entries with the value TRUE
    $display("All index with value TRUE=",Result);
    $display("======================= OR ============================");
    $display("All index with value TRUE:");
    foreach(Result[i]) begin
      $display("%0d: %0d",i+1,Result[i]);
    end    
  end
endmodule