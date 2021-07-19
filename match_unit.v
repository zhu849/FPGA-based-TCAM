module match_unit
#(
    parameter MAX_RULE = 64,
    parameter RULE_LEN = 32
)
(
    output reg match_out[MAX_RULE-1:0],
    
    input rst,
    input clk,
    input [31:0] search_data
);
    
function integer log2_res;
    input integer number;
    begin
        log2_res=0;
        while(2**log2_res < number)
            log2_res=log2_res+1;
    end
endfunction // log2_res   

// Count how many sub-TCAM should created
function integer num_subTCAM;
    input integer number;
    begin
        num_subTCAM = 0;
        while((num_subTCAM*6) < RULE_LEN)
            num_subTCAM = num_subTCAM + 1;
    end
endfunction

/*Reg, Wire define*/
(* ram_style = "distributed" *) reg [RULE_LEN:0] addr_block [MAX_RULE-1:0];// Define a address table use distributed RAM, also called this table is a TCAM


// Create rule RAM(Address-block)
 genvar i,j;
 generate
    //Make TCAM space entry by entry
    for(i=0;i<MAX_RULE;i=i+1)
    begin
        // Read multiple sub-TCAM from different module
        for(j=0;j<num_subTCAM(RULE_LEN);j=j+1)
        begin
            // Assign parameter to sub-TCAM module
            ram
            #(.NUM(i),
              .START_INDEX(j*6),
              .END_INDEX(j*6+5)
            )
            ram (
              .dout(addr_block[i][j*6:j*6+5])
            );
        end
    end
 endgenerate
    
 
    
endmodule
