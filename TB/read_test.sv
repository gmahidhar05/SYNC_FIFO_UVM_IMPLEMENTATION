class read_test extends fifo_base_test;

`uvm_component_utils(read_test)

read_sequence rseq;
//fifo_env env;
function new(string name="read_test",uvm_component parent= null);
super.new(name,parent);

endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
rseq=read_sequence::type_id::create("rseq");
//env=fifo_env::type_id::create("env",this);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
phase.raise_objection(this);
`uvm_info(get_type_name(),$sformatf("read_test"),UVM_LOW);

rseq.start(env.agt.sqr);

phase.drop_objection(this);
endtask

endclass
