class fifo_base_sequence extends uvm_sequence#(fifo_seq_item);

`uvm_object_utils(fifo_base_sequence)


function new(string name="fifo_base_sequence");
super.new(name);
endfunction

virtual task body();
$display("fifo base sequence");
repeat(20)
begin
`uvm_do(req);
//req.print();
end
endtask

endclass
