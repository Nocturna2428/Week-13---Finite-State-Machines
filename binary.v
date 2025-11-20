module binary(
    input w,
    input clk,
    output z
);

    wire [1:0] State;
    wire [1:0] Next;
// this is the action and state for some buttons
    dff zero(
        .D(Next[0]),
        .clk(clk),
        .Q(State[0])
    );

    dff one(
        .D(Next[1]),
        .clk(clk),
        .Q(State[1])
    );

    assign z = State[1] & ~State[0];
    assign Next[0] = w & ~State[1] & ~State[0];
    assign Next[1] = w & (State[1] | State[0]);

endmodule
