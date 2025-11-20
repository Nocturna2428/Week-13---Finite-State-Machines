module binary(// Implement binary state machine
    input w, clk, reset,
    output z,
    output State0, State1, State2
);
    wire [2:0] Next;
    
    dff zero(
        .D(Next[0]),
        .clk(clk),
        .Q(State0),
        .reset(reset)
        );
        
    dff one(
        .D(Next[1]),
        .clk(clk),
        .Q(State1),
        .reset(reset)
        );
        
    dff two(
        .D(Next[2]),
        .clk(clk),
        .Q(State2),
        .reset(reset)
        );
        
    assign z = (State1 & ~State0) | (State2 & ~State0);
    assign Next[0] = (State2 & w) | (State1 & State0 & w);
    assign Next[1] = (~State2 & State1 &~State0) | (~State2 & ~ State0 & w) | (State0 & ~State1);
    assign Next[2] = (~State1 & ~State0 &~w) | (~State2 & ~State0 & w) | (~State2 & ~State1 & w) | (State1 & State0 & ~w) | (State2 & ~w);

endmodule
