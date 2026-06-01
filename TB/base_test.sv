class fifo_base_test extends uvm_test;

`uvm_component_utils(fifo_base_test)

fifo_base_sequence bseq;
fifo_env env;

UVM_FILE drv_log,mon_log,scb_log;

function new(string name="fifo_base_test",uvm_component parent= null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
bseq=fifo_base_sequence::type_id::create("bseq");
env=fifo_env::type_id::create("env",this);
endfunction

function void start_of_simulation_phase(uvm_phase phase);
drv_log = $fopen("driver.log","w");
mon_log= $fopen("monitor.log","w");
scb_log=$fopen("scoreboard.log","w");

env.agt.drv.set_report_default_file(drv_log);
env.agt.mon.set_report_default_file(mon_log);
env.scb.set_report_default_file(scb_log);

env.agt.drv.set_report_severity_action_hier(UVM_INFO, UVM_DISPLAY | UVM_LOG);
env.agt.mon.set_report_severity_action_hier(UVM_INFO, UVM_DISPLAY | UVM_LOG);
env.scb.set_report_severity_action_hier(UVM_INFO, UVM_DISPLAY | UVM_LOG);
endfunction

function void final_phase(uvm_phase phase);
$fclose(drv_log);
$fclose(mon_log);
$fclose(scb_log);
endfunction

virtual task run_phase(uvm_phase phase);
//phase.raise_objection(this);
super.run_phase(phase);
//`uvm_info(get_type_name(),$sformatf("fifo_base_test"),UVM_LOW);
//bseq.start(env.agt.sqr);

//phase.drop_objection(this);
endtask

endclass
