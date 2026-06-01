class write_test extends fifo_base_test;

`uvm_component_utils(write_test)

write_sequence wseq;
//fifo_env env;
function new(string name="write_test",uvm_component parent= null);
super.new(name,parent);

endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
wseq=write_sequence::type_id::create("wseq");
//env=fifo_env::type_id::create("env",this);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
phase.raise_objection(this);
`uvm_info(get_type_name(),$sformatf("write_test"),UVM_LOW);
wseq.start(env.agt.sqr);

phase.drop_objection(this);
endtask

endclass
