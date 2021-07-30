module priority_encoder
#( parameter MAX_RULE = 64
)
(
output reg match,
output reg [log2(MAX_RULE)-1:0] match_addr,
input [MAX_RULE-1:0] match_vec,
input clk
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

integer i;
always@(posedge clk)
begin
	if(match_vec[0])
	begin
		match_addr = 0;
		match <= 1;
	end
	else if(match_vec[1])
	begin
		match_addr <= 1;
		match <= 1;
	end
	else if(match_vec[2])
	begin
		match_addr <= 2;
		match <= 1;
	end
	else if(match_vec[3])
	begin
		match_addr <= 3;
		match <= 1;
	end
	else if(match_vec[4])
	begin
		match_addr <= 4;
		match <= 1;
	end
	else if(match_vec[5])
	begin
		match_addr <= 5;
		match <= 1;
	end
	else if(match_vec[6])
	begin
		match_addr <= 6;
		match <= 1;
	end
	else if(match_vec[7])
	begin
		match_addr <= 7;
		match <= 1;
	end
	else if(match_vec[8])
	begin
		match_addr <= 8;
		match <= 1;
	end
	else if(match_vec[9])
	begin
		match_addr <= 9;
		match <= 1;
	end
	else if(match_vec[10])
	begin
		match_addr <= 10;
		match <= 1;
	end
	else if(match_vec[11])
	begin
		match_addr <= 11;
		match <= 1;
	end
	else if(match_vec[12])
	begin
		match_addr <= 12;
		match <= 1;
	end
	else if(match_vec[13])
	begin
		match_addr <= 13;
		match <= 1;
	end
	else if(match_vec[14])
	begin
		match_addr <= 14;
		match <= 1;
	end
	else if(match_vec[15])
	begin
		match_addr <= 15;
		match <= 1;
	end
	else if(match_vec[16])
	begin
		match_addr <= 16;
		match <= 1;
	end
	else if(match_vec[17])
	begin
		match_addr <= 17;
		match <= 1;
	end
	else if(match_vec[18])
	begin
		match_addr <= 18;
		match <= 1;
	end
	else if(match_vec[19])
	begin
		match_addr <= 19;
		match <= 1;
	end
	else if(match_vec[20])
	begin
		match_addr <= 20;
		match <= 1;
	end
	else if(match_vec[21])
	begin
		match_addr <= 21;
		match <= 1;
	end
	else if(match_vec[22])
	begin
		match_addr <= 22;
		match <= 1;
	end
	else if(match_vec[23])
	begin
		match_addr <= 23;
		match <= 1;
	end
	else if(match_vec[24])
	begin
		match_addr <= 24;
		match <= 1;
	end
	else if(match_vec[25])
	begin
		match_addr <= 25;
		match <= 1;
	end
	else if(match_vec[26])
	begin
		match_addr <= 26;
		match <= 1;
	end
	else if(match_vec[27])
	begin
		match_addr <= 27;
		match <= 1;
	end
	else if(match_vec[28])
	begin
		match_addr <= 28;
		match <= 1;
	end
	else if(match_vec[29])
	begin
		match_addr <= 29;
		match <= 1;
	end
	else if(match_vec[30])
	begin
		match_addr <= 30;
		match <= 1;
	end
	else if(match_vec[31])
	begin
		match_addr <= 31;
		match <= 1;
	end
	else if(match_vec[32])
	begin
		match_addr <= 32;
		match <= 1;
	end
	else if(match_vec[33])
	begin
		match_addr <= 33;
		match <= 1;
	end
	else if(match_vec[34])
	begin
		match_addr <= 34;
		match <= 1;
	end
	else if(match_vec[35])
	begin
		match_addr <= 35;
		match <= 1;
	end
	else if(match_vec[36])
	begin
		match_addr <= 36;
		match <= 1;
	end
	else if(match_vec[37])
	begin
		match_addr <= 37;
		match <= 1;
	end
	else if(match_vec[38])
	begin
		match_addr <= 38;
		match <= 1;
	end
	else if(match_vec[39])
	begin
		match_addr <= 39;
		match <= 1;
	end
	else if(match_vec[40])
	begin
		match_addr <= 40;
		match <= 1;
	end
	else if(match_vec[41])
	begin
		match_addr <= 41;
		match <= 1;
	end
	else if(match_vec[42])
	begin
		match_addr <= 42;
		match <= 1;
	end
	else if(match_vec[43])
	begin
		match_addr <= 43;
		match <= 1;
	end
	else if(match_vec[44])
	begin
		match_addr <= 44;
		match <= 1;
	end
	else if(match_vec[45])
	begin
		match_addr <= 45;
		match <= 1;
	end
	else if(match_vec[46])
	begin
		match_addr <= 46;
		match <= 1;
	end
	else if(match_vec[47])
	begin
		match_addr <= 47;
		match <= 1;
	end
	else if(match_vec[48])
	begin
		match_addr <= 48;
		match <= 1;
	end
	else if(match_vec[49])
	begin
		match_addr <= 49;
		match <= 1;
	end
	else if(match_vec[50])
	begin
		match_addr <= 50;
		match <= 1;
	end
	else if(match_vec[51])
	begin
		match_addr <= 51;
		match <= 1;
	end
	else if(match_vec[52])
	begin
		match_addr <= 52;
		match <= 1;
	end
	else if(match_vec[53])
	begin
		match_addr <= 53;
		match <= 1;
	end
	else if(match_vec[54])
	begin
		match_addr <= 54;
		match <= 1;
	end
	else if(match_vec[55])
	begin
		match_addr <= 55;
		match <= 1;
	end
	else if(match_vec[56])
	begin
		match_addr <= 56;
		match <= 1;
	end
	else if(match_vec[57])
	begin
		match_addr <= 57;
		match <= 1;
	end
	else if(match_vec[58])
	begin
		match_addr <= 58;
		match <= 1;
	end
	else if(match_vec[59])
	begin
		match_addr <= 59;
		match <= 1;
	end
	else if(match_vec[60])
	begin
		match_addr <= 60;
		match <= 1;
	end
	else if(match_vec[61])
	begin
		match_addr <= 61;
		match <= 1;
	end
	else if(match_vec[62])
	begin
		match_addr <= 62;
		match <= 1;
	end
	else if(match_vec[63])
	begin
		match_addr <= 63;
		match <= 1;
	end
	else 
		match <= 0;
end

endmodule // priority_encoder_v2