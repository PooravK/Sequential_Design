`timescale  1ns/1ps

module tb_SISO();
    reg clk;
    reg s_in;
    reg load;
    reg clear;
    wire s_out;

    SISO register (
        .clk(clk),
        .s_in(s_in),
        .load(load),
        .clear(clear),
        .s_out(s_out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("SISOwaveform.vcd");
        $dumpvars(0, tb_SISO);

        #1;
        clk = 1'b0;
        clear = 1'b1;
        load = 1'b0;
        s_in = 1'b0;

        #10;
        clear = 1'b0;
        @(posedge clk);
        clear = 1'b1;

        load = 1'b1;
        s_in = 1'b1;

        @(posedge clk);
        s_in = 1'b1; @(posedge clk);
        s_in = 1'b1; @(posedge clk);
        s_in = 1'b0; @(posedge clk);
        s_in = 1'b1; @(posedge clk);
        s_in = 1'b0; @(posedge clk);
        s_in = 1'b0; @(posedge clk);
        s_in = 1'b1; @(posedge clk);
        s_in = 1'b0; @(posedge clk);

        s_in = 1'b0; @(posedge clk);
        s_in = 1'b0; @(posedge clk);
        s_in = 1'b0; @(posedge clk);
        s_in = 1'b0; @(posedge clk);
        s_in = 1'b0; @(posedge clk);
        s_in = 1'b0; @(posedge clk);
        s_in = 1'b0; @(posedge clk);

        load = 1'b0;
        @(posedge clk);
        $finish;
    end

    initial begin
        $monitor("Time=%0t, clear=%b, load=%b, s_in=%b, s_out=%b", $time, clear, load, s_in, s_out);
    end
endmodule