module match_unit
#( parameter MAX_RULE = 64, // # of rule 
   parameter KEY_LEN = 32 // search key lens
)
(
	output reg match, // check whether match the rule which store in ram entry
	input [KEY_LEN-1:0] search_key,//in this case search key is dst addr
	input [KEY_LEN-1:0] compare_rule,// one rule that in rule mem
	input	rst,
	input	clk
);


always@(posedge clk)
begin
	if(rst)
		match <= 0;
	else
	begin
		if(search_key == compare_rule)
			match <= 1;
		else
			match <= 0;
	end
end

endmodule // match_unit