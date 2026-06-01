import params::*;
class fifo_driver extends uvm_driver#(fifo_seq_item);


`uvm_component_utils(fifo_driver)

virtual fifo_if  vif;
function new(string name = "fifo_driver",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual fifo_if#(.DATA_WIDTH(DATA_WIDTH)))::get(this,"","vif",vif))
	$fatal("build_phase error","NO interface in build phase of dirver");
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
`uvm_info(get_type_name(),"run_phase driver",UVM_LOW);
forever
begin
@(posedge vif.clk);
//$display("time=%t---------------------------------------------------------------------------------------------",$time);
if(!vif.rst_n)
begin
reset();
end
else
begin
seq_item_port.get_next_item(req);
drive(req);
//main(req);
seq_item_port.item_done();
end
end
endtask

task drive(fifo_seq_item seq_item);
`uvm_info(get_type_name(),"drive task in driver",UVM_LOW);
	main(seq_item);
endtask

task reset();
vif.wr_en=0;
vif.rd_en=0;
vif.data_in=0;
//vif.data_out<=0;
//vif.empty<=0;
//vif.full<=0;
endtask

task main(fifo_seq_item seq_item);
`uvm_info(get_type_name(),"main task in driver",UVM_LOW);

begin
if(seq_item.wr_en )
begin
`uvm_info(get_type_name(),"write part main task in driver",UVM_LOW);
	vif.wr_en=seq_item.wr_en;
	vif.data_in=seq_item.data_in;
`uvm_info(get_type_name(),$sformatf("vif.wr_en=%d,vif.rd_en=%d,vif.data_in=%d,data_out=%d",vif.wr_en,vif.rd_en,vif.data_in,vif.data_out),UVM_LOW);
`uvm_info(get_type_name(),$sformatf("seq_item.wr_en=%d,seq_item.rd_en=%d,seq_item.data_in=%d,seq_item.data_out=%d",seq_item.wr_en,seq_item.rd_en,seq_item.data_in,seq_item.data_out),UVM_LOW);
end
else
begin
`uvm_info(get_type_name(),"read part main task in driver",UVM_LOW);
	vif.wr_en=seq_item.wr_en;
	vif.rd_en=seq_item.rd_en;
//`uvm_info(get_type_name(),$sformatf("vif.wr_en=%d,vif.rd_en=%d,vif.data_in=%d,vif.data_out=%d",vif.wr_en,vif.rd_en,vif.data_in,vif.data_out),UVM_LOW);
`uvm_info(get_type_name(),$sformatf("seq_item.wr_en=%d,seq_item.rd_en=%d,seq_item.data_in=%d,seq_item.data_out=%d",seq_item.wr_en,seq_item.rd_en,seq_item.data_in,seq_item.data_out),UVM_LOW);
end
end

endtask

endclass

/*
class fifo_driver extends uvm_driver#(fifo_seq_item);

import params::*;
`uvm_component_utils(fifo_driver)

virtual fifo_if  vif;
function new(string name = "fifo_driver",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual fifo_if#(.DATA_WIDTH(DATA_WIDTH)))::get(this,"","vif",vif))
	$fatal("build_phase error","NO interface in build phase of dirver");
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
`uvm_info(get_type_name(),"run_phase driver",UVM_LOW);
forever
begin
@(vif.driver_cb);
//$display("time=%t---------------------------------------------------------------------------------------------",$time);
if(!vif.rst_n)
begin
reset();
end
else
begin
seq_item_port.get_next_item(req);
drive(req);
seq_item_port.item_done();
end
end
endtask

task drive(fifo_seq_item seq_item);
`uvm_info(get_type_name(),"drive task in driver",UVM_LOW);
	main(seq_item);
endtask

task reset();
vif.driver_cb.wr_en<=0;
vif.driver_cb.rd_en<=0;
vif.driver_cb.data_in<=0;
//vif.driver_cb.data_out<=0;
//vif.driver_cb.empty<=0;
//vif.driver_cb.full<=0;
endtask

task main(fifo_seq_item seq_item);
`uvm_info(get_type_name(),"main task in driver",UVM_LOW);

begin
if(seq_item.wr_en )
begin
`uvm_info(get_type_name(),"write part main task in driver",UVM_LOW);
	vif.driver_cb.wr_en<=seq_item.wr_en;
	vif.driver_cb.data_in<=seq_item.data_in;
`uvm_info(get_type_name(),$sformatf("vif.wr_en=%d,vif.rd_en=%d,vif.data_in=%d,data_out=%d",vif.driver_cb.wr_en,vif.driver_cb.rd_en,vif.driver_cb.data_in,vif.driver_cb.data_out),UVM_LOW);
`uvm_info(get_type_name(),$sformatf("seq_item.wr_en=%d,seq_item.rd_en=%d,seq_item.data_in=%d,seq_item.data_out=%d",seq_item.wr_en,seq_item.rd_en,seq_item.data_in,seq_item.data_out),UVM_LOW);
end
else
begin
`uvm_info(get_type_name(),"read part main task in driver",UVM_LOW);
	vif.driver_cb.wr_en<=seq_item.wr_en;
	vif.driver_cb.rd_en<=seq_item.rd_en;
//`uvm_info(get_type_name(),$sformatf("vif.wr_en=%d,vif.rd_en=%d,vif.data_in=%d,vif.data_out=%d",vif.wr_en,vif.rd_en,vif.data_in,vif.data_out),UVM_LOW);
`uvm_info(get_type_name(),$sformatf("seq_item.wr_en=%d,seq_item.rd_en=%d,seq_item.data_in=%d,seq_item.data_out=%d",seq_item.wr_en,seq_item.rd_en,seq_item.data_in,seq_item.data_out),UVM_LOW);
end
end

endtask

endclass*/
