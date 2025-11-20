module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    // Hook up binary and one-hot state machines
    onehot onehot_inst(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(led[0]),
        .A(led[2]),
        .B(led[3]),
        .C(led[4]),
        .D(led[5]),
        .E(led[6])        
    );
    
    binary binary_inst(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .zero(led[7]),
        .one(led[8]),
        .two(led[9]),
        .z(led[1])        
    );
endmodule
