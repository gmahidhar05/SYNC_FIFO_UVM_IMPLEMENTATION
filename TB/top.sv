module top;

parameter DATA_WIDTH=8;

reg clk,rst_n;

fifo_if#(.DATA_WIDTH(DATA_WIDTH)) mif(clk,rst_n);
sync_fifo_m1 dut (.clk(mif.clk),.rst_n(mif.rst_n),.w_en(mif.wr_en),.r_en(mif.rd_en),.data_in(mif.data_in),.data_out(mif.data_out),.full(mif.full),.empty(mif.empty));

initial
begin
clk=1'b0;
forever #5 clk=~clk;
end

initial
begin
rst_n=1'b1;
@(posedge clk)
rst_n=1'b0;
@(posedge clk)
rst_n=1'b1;
end


initial
begin
uvm_config_db#(virtual fifo_if#(.DATA_WIDTH(DATA_WIDTH)))::set(null,"","vif",mif);
end

initial
begin

/*run_test("fifo_base_test");
run_test("write_test");
run_test("read_test");
*/
run_test("all_test");
//run_test("write_read_test");
end

initial
begin
$shm_open("waves.shm");
$shm_probe("AS",top);
end
endmodule
