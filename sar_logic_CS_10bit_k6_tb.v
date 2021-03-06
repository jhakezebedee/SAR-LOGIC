`timescale 1ns/100ps

module sar_logic_CS_10bit_k6_tb;
	reg clk;
	reg rst;
	reg cnvst;
	reg cmp_out;
	reg cmp_out_coarse;
	wire [9:0] sar; // digital output
	wire eoc; // end of conversion
	wire cmp_clk; // comparator clock
	wire cmp_clk_coarse;

	wire s_clk; // bootstrap switch clock
	wire [19:0] fine_btm;
	wire [11:0] coarse_btm;
	wire fine_switch_drain;
	wire coarse_switch_drain;

	//INVERTED OUTPUTS
	wire s_clk_not;
	wire [19:0] fine_btm_not;
	wire [11:0] coarse_btm_not;
	wire fine_switch_drain_not;
	wire coarse_switch_drain_not;


	sar_logic_CS_10bit_k6 test(clk, rst, cnvst, cmp_out, cmp_out_coarse, sar, eoc, cmp_clk, cmp_clk_coarse, s_clk, fine_btm, coarse_btm, fine_switch_drain, coarse_switch_drain, s_clk_not, fine_btm_not, coarse_btm_not, fine_switch_drain_not, coarse_switch_drain_not);

	always #5 clk = !clk;

	initial begin

		$dumpfile("sar_logic_CS_10bit_k6.vcd");
		$dumpvars(0, sar_logic_CS_10bit_k6_tb);

		clk = 0;
		rst = 1;
		cnvst = 0;
		cmp_out = 1;
		cmp_out_coarse = 1;

		#30

		rst = 0;
		cmp_out = 0;
		cnvst = 1;

		#20

		cnvst = 1;

		#300

		

		$finish;

	end
endmodule