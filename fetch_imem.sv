// // --------------------------------------------------------
// // Instruction Memory - RTL
// // --------------------------------------------------------
//
module yarp_instr_mem (
  input    logic          clk,
  input    logic          reset_n,

  input    logic [31:0]   instr_mem_pc_i,

  // Output read request to memory
  output   logic          instr_mem_req_o,
  output   logic [31:0]   instr_mem_addr_o,

  // Read data from memory
  input    logic [31:0]   mem_rd_data_i,

  // Instruction output
  output   logic [31:0]   instr_mem_instr_o
);

  // Write your logic here...
  logic instr_mem_req_q;
 
  //active low reset
  //if out of reset fetch unit must send req to receive instruction from memory
 
  always_ff @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      instr_mem_req_q <= 1'b0;
    else 
      instr_mem_req_q <= 1'b1;
  end
  
  //connecting output signals
  assign instr_mem_req_o = instr_mem_req_q;
  assign instr_mem_addr_o = instr_mem_pc_i;
  assign instr_mem_instr_o = mem_rd_data_i;
  
endmodule
