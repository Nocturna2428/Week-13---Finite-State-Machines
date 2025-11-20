module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);
    // Hook up binary and one-hot state machines
    one_hot(
        .w(sw),
        .clk(btnC),
        .z(led[0]),
        .Astate(led[2]),
        .Bstate(led[3]),
        .Cstate(led[4]),
        .Dstate(led[5]),
        .Estate(led[6]),
        .reset(btnU)
        );
        
    binary binary(
        .w(sw),
        .clk(btnC),
        .z(led[1]),
        .State0(led[7]),
        .State1(led[8]),
        .State2(led[9]),
        .reset(btnU)
        );
        
endmodule
