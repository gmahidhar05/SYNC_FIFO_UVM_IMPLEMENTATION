import params::*;
class fifo_monitor extends uvm_monitor;


`uvm_component_utils(fifo_monitor)

fifo_seq_item seq_item;
virtual fifo_if  vif;

uvm_analysis_port#(fifo_seq_item) item_collected_port;

function new(string name = "fifo_monitor",uvm_component parent=null);
super.new(name,parent);
seq_item=new();
item_collected_port=new("item_collected_port",this);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual fifo_if#(.DATA_WIDTH(DATA_WIDTH)))::get(this,"","vif",vif))
	$fatal("build_phase error","NO interface in build phase of monitor");
endfunction

/*
task run_phase(uvm_phase phase);
super.run_phase(phase);
forever
begin
@(posedge vif.clk);
monitor(seq_item);
end
endtask

task monitor(fifo_seq_item seq_item);
if(vif.rst_n)
begin
`uvm_info(get_type_name(),$sformatf("monitor task------------"),UVM_LOW);
seq_item.wr_en=vif.wr_en;
seq_item.rd_en=vif.rd_en;
seq_item.data_in=vif.data_in;
seq_item.data_out=vif.data_out;
seq_item.full=vif.full;
seq_item.empty=vif.empty;
`uvm_info(get_type_name(),$sformatf("time=%t seq_item.wr_en=%d,seq_item.rd_en=%d,seq_item.data_in=%d,seq_item.data_out=%d vif.rst_n=%d",$time,seq_item.wr_en,seq_item.rd_en,seq_item.data_in,seq_item.data_out,vif.rst_n),UVM_LOW);
`uvm_info(get_type_name(),$sformatf("vif.wr_en=%d,vif.rd_en=%d,vif.data_in=%d,data_out=%d",vif.wr_en,vif.rd_en,vif.data_in,vif.data_out),UVM_LOW);
item_collected_port.write(seq_item);
end
endtask*/


/*
task run_phase(uvm_phase phase);
super.run_phase(phase);
forever
begin

@(vif.monitor_cb);
//#2;
monitor(seq_item);
end
endtask

task monitor(fifo_seq_item seq_item);
`uvm_info(get_type_name(),$sformatf("monitor task------------"),UVM_LOW);
seq_item.wr_en=vif.monitor_cb.wr_en;
seq_item.rd_en=vif.monitor_cb.rd_en;
seq_item.data_in=vif.monitor_cb.data_in;
seq_item.data_out=vif.monitor_cb.data_out;
seq_item.full=vif.monitor_cb.full;
seq_item.empty=vif.monitor_cb.empty;
`uvm_info(get_type_name(),$sformatf("time=%t seq_item.wr_en=%d,seq_item.rd_en=%d,seq_item.data_in=%d,seq_item.data_out=%d vif.monitor_cb.monitor_cb.rst_n=%d",$time,seq_item.wr_en,seq_item.rd_en,seq_item.data_in,seq_item.data_out,vif.rst_n),UVM_LOW);
`uvm_info(get_type_name(),$sformatf("vif.monitor_cb.monitor_cb.wr_en=%d,vif.rd_en=%d,vif.data_in=%d,data_out=%d",vif.wr_en,vif.rd_en,vif.data_in,vif.data_out),UVM_LOW);
endtask

*/
endclass
