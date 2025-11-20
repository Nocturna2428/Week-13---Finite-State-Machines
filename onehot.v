
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
    
    wire Anext, Bnext, Cnext;
    wire Astate, Bstate, Cstate;

    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .Q(Astate)
    );

    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .Q(Bstate)
    );

    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .Q(Cstate)
    );

    assign z = Cstate;

    assign Anext = ~w;
    assign Bnext = w & Astate;
    assign Cnext = (w & Bstate) | (w & Cstate);
endmodule
