class write_sequence extends uvm_sequence#(fifo_seq_item);

`uvm_object_utils(write_sequence)

function new(string name="write_sequence");
super.new(name);
endfunction

virtual task body();
repeat(10) begin
//$display("fifo write sequence");
`uvm_do_with(req,{req.wr_en==1;});
//req.print();
end

endtask

endclass
