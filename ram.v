
module ram 
#( parameter NUM = 0,//Rule of index
   parameter START_INDEX = 0,// Sub-TCAM start index
   parameter END_INDEX = 0//Sub-TCAM end index
)
(
    output [5:0] dout//Reg for store data
);

// Read rule data from file
initial
    $readmemb({NUM, "_RAM.txt"}, dout, START_INDEX, END_INDEX);

endmodule
