class all_test extends fifo_base_test;

`uvm_component_utils(all_test)

fifo_base_sequence bseq;
write_sequence wseq;
read_sequence rseq;
write_read_sequence wr_rd_seq;
//fifo_env env;

function new(string name="all_test",uvm_component parent= null);
super.new(name,parent);

endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
bseq=fifo_base_sequence::type_id::create("bseq");
wseq=write_sequence::type_id::create("wseq");
rseq=read_sequence::type_id::create("rseq");
wr_rd_seq=write_read_sequence::type_id::create("wr_rd_seq");
//env=fifo_env::type_id::create("env",this);
endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
super.run_phase(phase);
/*`uvm_info(get_type_name(),$sformatf("fifo_base_sequence"),UVM_LOW);
bseq.start(env.agt.sqr);
`uvm_info(get_type_name(),$sformatf("write_sequence"),UVM_LOW);
wseq.start(env.agt.sqr);
`uvm_info(get_type_name(),$sformatf("read_sequence"),UVM_LOW);
rseq.start(env.agt.sqr);*/
`uvm_info(get_type_name(),$sformatf("write_read_sequence"),UVM_LOW);
wr_rd_seq.start(env.agt.sqr);
#30;
phase.drop_objection(this);
endtask

endclass
