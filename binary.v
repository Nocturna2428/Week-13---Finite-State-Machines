// Implement binary state machine
module binary(
    input w,
    input clk,
    input reset,
    output z, zero, one, two
); 
    wire [2:0] State;
    wire [2:0] Next;
    
    dff dff_zero(
        .Default(0),
        .D(Next[0]),
        .reset(reset),
        .clk(clk),
        .Q(State[0])
    );
    
    dff dff_one(
        .Default(0),
        .D(Next[1]),
        .reset(reset),
        .clk(clk),
        .Q(State[1])
    );
    
    dff dff_two(
        .Default(0),
        .D(Next[2]),
        .reset(reset),
        .clk(clk),
        .Q(State[2])
    );
    
    assign Next[0] = (~w & ~State[1] & ~State[0]) | (w & ~State[2] & ~State[1]) | (w & ~State[2] & ~State[0]) | (~w & State[1] & State[0]);
        
        
    assign Next[1] = (~State[1] & State[0]) | (State[1] & ~State[0]) | (w & ~State[2] & ~State[1]);
        
         
    assign Next[2] = (w & State[2]) | (w & State[1] & State[0]);
       
    
    assign z = (~State[2] &  State[1] & ~State[0]) | ( State[2] & ~State[1] & ~State[0]);
    
    assign zero = State[0];
    assign one = State[1];
    assign two = State[2];
    
endmodule
