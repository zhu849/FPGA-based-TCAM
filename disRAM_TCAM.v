`timescale 1ns / 1ps

module disRAM_TCAM
#(parameter NUM_NODE = 16,// # of next-hop
  parameter RULE_LEN = 32,//Length to stroe dst address
  parameter MAX_RULE = 64 // # of rules 
)
(
    output reg match,
    
    input clk,
    input rst,
    input [31:0] search_data // Input search key, in this case is dst address
);

function integer log2_res;
    input integer number;
    begin
        log2_res=0;
        while(2**log2_res < number)
            log2_res=log2_res+1;
    end
endfunction // log2_res


match_unit mu
(
  .clk(clk),
  .rst(rst),
  .search_data(search_data)
);

priority_encoder pe
(
);



 
 



endmodule
