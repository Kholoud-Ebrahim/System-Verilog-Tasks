module FIFO_OOP();
  class Fifo #(parameter Width=16);
    local bit[Width-1:0] queue[$]; // or protected
    function new();
      queue={2,10,33};
      $display("===================================================");
      $display("The queue before any operation: ",queue);
      $display("===================================================");
    endfunction
    // choose= 1 while pushing or poping front
    // choose= 0 while pushing or poping back
    function void Push(bit choose, bit[Width-1:0]pushed_value);
      if(choose)  begin
        queue.push_front(pushed_value);
        $display("The queue after pushing front[%0d]: ",pushed_value,queue);
      end
      else begin
        queue.push_back (pushed_value);
        $display("The queue after pushing back[%0d]: ",pushed_value,queue);
      end
      $display("===================================================");
    endfunction
    
    function void PoP(bit choose);
      if(choose) begin
        queue.pop_front();
        $display("The queue after poping front: ",queue);
      end
      else begin
        queue.pop_back ();
        $display("The queue after poping back: ",queue);
      end
      $display("===================================================");
    endfunction
    
    function void insert(bit[Width-1:0]value_location, bit[Width-1:0]inserted_value);
      queue.insert(value_location,inserted_value);
      $display("The queue after inserting[%0d] at [%0d]: ",inserted_value,value_location,queue);
      $display("===================================================");
    endfunction
    
    function void delete(bit[Width-1:0]value_location);
      queue.delete(value_location);
      $display("The queue after deleting the element[%0d]: ",value_location,queue);
      $display("===================================================");
    endfunction    
    
  endclass
  Fifo F1;
  initial begin
    F1= new();
    F1.Push(1, 8);    //{8,2,10,33}
    F1.PoP(0);        //{8,2,10}
    F1.Push(0, 44);   //{8,2,10,44}
    F1.Push(0, 7);    //{8,2,10,44,7}
    F1.PoP(1);        //{2,10,44,7}
    F1.insert(2,50);  //{2,10,50,44,7}
    F1.insert(1,88);  //{2,88,10,50,44,7}
    F1.delete(4);     //{2,88,10,50,7}
  end
endmodule