module disRamTCAM 
#( parameter MAX_RULE = 64, // # of rule 
   parameter NEXTHOP_LEN = 32, // nexthop lens
   parameter KEY_LEN = 32 // search key lens
)
(
	output reg match, // check whether match the rule which store in ram entry
	output reg [NEXTHOP_LEN-1:0] nexthop, // nexthop return to testbench that find out 	
	input [KEY_LEN-1:0] search_key,//in this case search key is dst addr
	input [KEY_LEN-1:0] rule_key,
	input [KEY_LEN-1:0] nexthop_key,
	input build_signal, // use to signal this module start build
	input search_signal,
	output reg build_over,
	input clk, 
	input rst
);

function integer log2;
	input integer number;
	begin
		log2=0;
		while(2**log2<number) begin
			log2=log2+1;
		end
	end
endfunction // log2

/*Reg, Wire define*/
// Use with match unit
wire total_match;
wire [MAX_RULE-1:0] match_out; // store whether match with every match unit 
reg [MAX_RULE-1:0] match_out_reg;

// Use with priority encoder
wire [log2(MAX_RULE)-1:0] match_addr;
reg [log2(MAX_RULE)-1:0] match_addr_reg;

reg [6:0] c = 0;
// Rule memory, size is (KEY_LEN*MAX_RULE)
(* ram_style = "distributed" *) reg [KEY_LEN-1:0] rule_mem [MAX_RULE-1:0];

// Nexthop memory, size is (KEY_LEN*MAX_RULE)
(* ram_style = "distributed" *) reg [KEY_LEN-1:0] nexthop_mem [MAX_RULE-1:0];

genvar i;
generate
	//every match unit will have one match (so will call it parallel)
	for(i=0;i<MAX_RULE;i=i+1)
	begin
		match_unit
		#(.MAX_RULE(64),
		  .KEY_LEN(32)
		)
		mu(
		  .match(match_out[i]),
		  .search_key(search_key),
		  .compare_rule(rule_mem[i]),
		  .rst(rst),
		  .clk(clk)
		);
	end
endgenerate

integer j;
always@(posedge clk)
begin
	for(j=0;j<MAX_RULE;j=j+1)
		match_out_reg[j] = match_out[j];
end

priority_encoder
#(.MAX_RULE(MAX_RULE)
)
pe (
	.match(total_match),
	.match_addr(match_addr),
	.match_vec(match_out_reg),
	.clk(clk)
);
always@(posedge clk)
begin
	if(build_signal)
	begin
		rule_mem[c] <= rule_key;
		nexthop_mem[c] <= nexthop_key;
		$display("set rule & next [%d]=> rule:%b, nexthop:%b\n",c,rule_mem[c-1],nexthop_mem[c-1]);
		c <= c + 1;
		if(c == 63)
			build_over = 1'b1;

	end
	else if(search_signal)
	begin
		nexthop <= nexthop_mem[match_addr_reg];
		match_addr_reg <= match_addr;
		match <= total_match; 
	end
end



endmodule