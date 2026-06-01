class write_read_test extends fifo_base_test;

`uvm_component_utils(write_read_test)

write_read_sequence wr_rd_seq;
//fifo_env env;
function new(string name="write_read_test",uvm_component parent= null);
super.new(name,parent);

endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
wr_rd_seq=write_read_sequence::type_id::create("wr_rd_seq");
//env=fifo_env::type_id::create("env",this);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
phase.raise_objection(this);
`uvm_info(get_type_name(),$sformatf("write_test"),UVM_LOW);
wr_rd_seq.start(env.agt.sqr);
#30;
phase.drop_objection(this);
endtask

endclass
