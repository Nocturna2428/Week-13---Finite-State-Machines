
module one_hot(
    input w,
    input reset,
    input clk,
    output z,
    output [4:0] state_out //this is due to the flip-flop table
);
   //state flip-flops from the table 
    reg A, B, C, D, E;
 // Output: z = 1 only in state C or E
    assign z = C | E;

    // This is here for debugging
    assign state_out = {E, D, C, B, A};
    
    
    wire Anext = (A & w == 0) ? 0 : 0; 
    wire Bnext = (A & ~w) | (D & ~w) | (E & ~w);
    wire Cnext = (B & ~w) | (C & ~w);
    wire Dnext = (A & w) | (B & w) | (C & w);
    wire Enext = (D & w) | (E & w);

    // Sequential update
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A <= 1; B <= 0; C <= 0; D <= 0; E <= 0;   // Initial state A
        end
        else begin
            A <= 0;             // A is never a next state in this machine
            B <= Bnext;
            C <= Cnext;
            D <= Dnext;
            E <= Enext;
        end
    end

endmodule
