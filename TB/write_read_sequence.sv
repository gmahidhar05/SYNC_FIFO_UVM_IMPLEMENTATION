class write_read_sequence extends uvm_sequence#(fifo_seq_item);

`uvm_object_utils(write_read_sequence)

function new(string name="write_read_sequence");
super.new(name);
endfunction

virtual task body();
begin
repeat(8) begin
$display("fifo write sequence");
`uvm_do_with(req,{req.wr_en==1;});
req.print();
end

repeat(8) begin
$display("fifo read sequence");
`uvm_do_with(req,{req.rd_en==1;});
req.print();
end

#30;
end
endtask

endclass
