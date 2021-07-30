`timescale 1ns/10ps
`define CYCLE      2.0          	  
`define End_CYCLE  100000000              
`define RULE_MEM	"rule_mem.txt"
`define NEXTHOP_MEM "nexthop_mem.txt"   

module testfixture;
	reg [31:0] rule_mem [63:0];
	reg [31:0] nexthop_mem [63:0];
	reg [31:0] search_key;
	wire [31:0] nexthop;
	reg [31:0] nexthop_reg;
	wire match;
	reg [31:0] rule_key;
	reg [31:0] nexthop_key;
	// control signal
	reg build_signal;
	wire build_over;
	reg search_signal;
	reg match_reg;
	reg clk = 0;
	reg rst = 0;
	reg ready = 0;
	reg [6:0] i = 0;
	reg [6:0] k = 0;

// clk setting
always begin #(`CYCLE/2) clk = ~clk; end

// read data from file, input to TB memory
integer j;
initial begin
	$readmemb(`RULE_MEM, rule_mem);
	$readmemb(`NEXTHOP_MEM, nexthop_mem);
	#1
	build_signal = 1'b1; // signal start build
	/* check whether read correct
	#(`CYCLE);
	for(j=0;j<64;j=j+1)
		$display("rule_mem[%d]:%b\n",j,rule_mem[j]);
	for(j=0;j<64;j=j+1)
		$display("next_mem[%d]:%b\n",j,nexthop_mem[j]);
	*/
end

// start setting
initial begin
	$display("-----------------------------------------------------\n");
	$display("START!!! Simulation Start .....\n");
	$display("-----------------------------------------------------\n");
	rst = 1'b1;
	#(`CYCLE); 
	rst = 1'b0;
end

// module definition
disRamTCAM 
#(.MAX_RULE(64),
  .NEXTHOP_LEN(32),
  .KEY_LEN(32)
)
dr_tcam(
	.match(match),
	.nexthop(nexthop),
	.search_key(search_key),
	.rule_key(rule_key),
	.nexthop_key(nexthop_key),
	.build_signal(build_signal),
	.search_signal(search_signal),
	.build_over(build_over),
	.clk(clk),
	.rst(rst)
);

always@(negedge clk)begin
	if(build_over)
	begin
		build_signal <= 0;
		search_signal <= 1;
	end

	if(build_signal)
	begin
		rule_key <= rule_mem[k];
		nexthop_key <= nexthop_mem[k];
		k = k + 1;
	end
	else if(search_signal) // build over than start search
	begin
		search_key <= rule_mem[i];
		nexthop_reg <= nexthop;
		match_reg <= match;
		$display("search_key:%b, match:%b, Nexthop:%b\n",search_key,match,nexthop);
		i = i + 1;
	end
end

endmodule