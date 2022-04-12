module tb_counter;
    reg clk;
    reg rstn;
    wire [3:0] out;

    counter c0 ( .clk(clk),
                 .rstn(rstn),
                 .out(out));

    always #5 clk = ~clk;

    initial begin
        clk <= 0;
        rstn <= 0;

        //Drive stimulus, reset asserted between
        #20 rstn <= 1;
        #80 rstn <= 0;
        #50 rstn <= 1;

        //Finish after 200 ns
        #20 $Finish;
    end
endmodule