`timescale 1ns/1ps

module tb_d_ff();
    reg clk;
    reg d;
    wire q_next;

    d_ff uut (
        .clk(clk),
        .q_next(q_next),
        .d(d)
    );

    initial begin
        clk = 1'b0;
        d = 1'b0;
        #2;
    end

    always begin
        clk = ~clk;
        #2;
    end

    initial begin
        $dumpfile("dffwaveform.vcd");
        $dumpvars(0, tb_d_ff);
        
        #5;
        d = 1'b0;
        #5;
        $display("d = %b | q_next = %b", d, q_next);
        d = 1'b1;
        #5;
        $display("d = %b | q_next = %b", d, q_next);
        d = 1'b0;
        #5;
        $display("d = %b | q_next = %b", d, q_next);
        d = 1'b1;
        #5;
        $display("d = %b | q_next = %b", d, q_next);
        $finish;
    end
endmodule