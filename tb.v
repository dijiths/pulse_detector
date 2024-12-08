// Code your testbench here
// or browse Examples
module pulseTb;
    reg clk, reset, L;
    wire P;


    pulse DUT(.clk(clk), .reset(reset), .L(L), .P(P));

   
    //clock generation
    always #5 clk = ~clk;

    initial 
    begin
        clk = 0;
        #5 reset =0;
        #7 reset = 1;
        #5 reset = 0;

        #7 L = 1'b0;
        #20 L = 1'b1;
        #20 L = 1'b0;
        #20 L = 1'b1;
        #200 $finish;
    end

    initial 
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0,pulseTb);
    end


endmodule

