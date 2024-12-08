// Code your design here
module pulse(input clk, reset, L, output P);
    reg[1:0] state,nextState;
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;

    //state register
    always @(posedge clk)
    begin
        if(reset) 
            state<=s0;
        else
            state<=nextState;
    end


    //next state logic
  always @(*)
    begin
        case(state)
        s0: nextState = L?s1:s0;
        s1: nextState = L?s2:s0;
        s2: nextState = L?s2:s0;
        endcase
    end

    //output logic
    assign P =(state ==s1);
    
endmodule

        



    