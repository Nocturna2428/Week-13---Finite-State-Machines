
module one_hot(
    input w, reset, clk,
    output z,
    output As, Bs, Cs, Ds, Es // they are A-E states
   //state flip-flops from the table 
   
);
 wire Anext, Bnext, Cnext, Dnext, Enext; 
  
    
    
    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .Q(Astate),
        .reset(reset)
        );
        
    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .Q(Bstate),
        .reset(reset)
         );
         
    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .Q(Cstate),
        .reset(reset)
        );
        
    dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .Q(Dstate),
        .reset(reset)
         );
     dff Edff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .Q(Estate),
        .reset(reset)
         );
           
         
    assign z = Cstate | Dstate;
    
    assign Anext = 0;
    assign Bnext = (~w & Astate) | (~w & Dstate)| (~w & Estate);
    assign Cnext = (~w & Bstate) | (~w & Cstate);
    assign Dnext = (w & Astate) |(w & Bstate) |(w & Cstate);
    assign Enext = (w & Dstate) | (w & Estate);
    

endmodule
