module fsm_binary(
    input clk,
    input reset,
    input w,
    output z,
    output [2:0] state
);

    reg [2:0] S;       // current state
    assign state = S;

    
    assign z = (S == 3'b010) | (S == 3'b100);

    reg [2:0] Next;

    // Next state logic (combinational)
    always @(*) begin
        case (S)
            3'b000: Next = (w ? 3'b011 : 3'b001); // A → D or B
            3'b001: Next = (w ? 3'b011 : 3'b010); // B → D or C
            3'b010: Next = (w ? 3'b011 : 3'b010); // C → D or C
            3'b011: Next = (w ? 3'b100 : 3'b001); // D → E or B
            3'b100: Next = (w ? 3'b100 : 3'b001); // E → E or B
            default: Next = 3'b000;               
        endcase
    end

    // Sequential update
    always @(posedge clk or posedge reset) begin
        if (reset)
            S <= 3'b000;   // This will start in A
        else
            S <= Next;
    end

endmodule
