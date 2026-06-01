import params::*;
class scoreboard extends uvm_scoreboard;


`uvm_component_utils(scoreboard)

fifo_seq_item seq_item;


uvm_analysis_imp#(fifo_seq_item,scoreboard) item_collected_export;

bit [DATA_WIDTH-1:0]mem[$];

function new(string name ="scoreboard",uvm_component parent = null);
super.new(name,parent);
seq_item=new();
item_collected_export=new("item_collecte_export",this);
endfunction


function void write(fifo_seq_item seq_item);
//item_collected_export.get(seq_item);
if(seq_item.wr_en && !seq_item.full)begin
mem.push_back(seq_item.data_in);
end
else if (seq_item.rd_en && !seq_item.empty)
begin
if(mem.size()>0)
begin
bit[DATA_WIDTH-1:0] expected_data;
expected_data= mem.pop_front();
if(seq_item.data_out===expected_data)
begin
`uvm_info(get_type_name(),"SCB match",UVM_LOW);
`uvm_info(get_type_name(),$sformatf("data_out=%d,expected_data=%d",seq_item.data_out,expected_data),UVM_LOW);
end
else
begin
`uvm_info(get_type_name(),"SCB_MISMATCH",UVM_LOW);
`uvm_info(get_type_name(),$sformatf("data_out=%d,expected_data=%d",seq_item.data_out,expected_data),UVM_LOW);
end
end
mem.push_back(seq_item.data_in);
end
endfunction





endclass
