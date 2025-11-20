
module one_hot(
    input w,
    input clk,
    output z
);
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
