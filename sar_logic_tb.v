`timescale 1ns/100ps

module sar_logic_tb;
	reg clk;
	reg rst;
	reg cnvst;
	reg cmp_out;
	wire [7:0] sar;
	wire eoc;
	wire cmp_clk;
	wire s_clk;

	wire [8:0] fine_sca1_top;
	wire [8:0] fine_sca1_btm;
	wire [8:0] fine_sca2_top;
	wire [8:0] fine_sca2_btm;


	sar_logic test(clk, rst, cnvst, cmp_out, sar, eoc, cmp_clk, s_clk, fine_sca1_top, fine_sca1_btm, fine_sca2_top, fine_sca2_btm);

	always #5 clk = !clk;

	initial begin

		$dumpfile("sar_logic.vcd");
		$dumpvars(0, sar_logic_tb);

		clk = 0;
		rst = 1;
		cnvst = 0;
		cmp_out = 0;

		#30

		rst = 0;
		cmp_out = 0;
		cnvst = 1;

		#20

		cnvst = 0;

		#300

		

		$finish;

	end
endmodule