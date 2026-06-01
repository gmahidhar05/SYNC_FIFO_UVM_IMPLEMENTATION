class read_sequence extends uvm_sequence#(fifo_seq_item);

`uvm_object_utils(read_sequence)

function new(string name="read_sequence");
super.new(name);
endfunction

virtual task body();
repeat(10) begin
//$display("fifo read sequence");
`uvm_do_with(req,{req.rd_en==1;});
//req.print();
end
endtask

endclass
