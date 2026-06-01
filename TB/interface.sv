interface fifo_if#(parameter int DATA_WIDTH=8)(input clk,rst_n);

logic wr_en,rd_en;
logic [DATA_WIDTH-1:0] data_in;
logic [DATA_WIDTH-1:0] data_out;
logic full,empty;

/*clocking driver_cb@(posedge clk);
default input #0ns output #0ns;
input full,empty,data_out;
output wr_en,rd_en,data_in;
endclocking

clocking monitor_cb@(posedge clk);
default input #0ns;
input data_in,wr_en,rd_en,full,empty,data_out;
endclocking*/
endinterface
