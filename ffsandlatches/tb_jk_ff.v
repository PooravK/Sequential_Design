`timescale 1ns/1ps

module tb_jk_ff();
    reg j;
    reg k;
    reg clk;
    wire q;

    jk_ff uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q)
    );

    initial begin
        j = 1'b0;
        k = 1'b0;
        clk = 1'b0;
        #2;
    end

    always begin
        clk = ~clk;
        #2;
    end

    initial begin
        $dumpfile("jkwaveform.vcd");
        $dumpvars(0, tb_jk_ff);

        j = 1'b0;
        k = 1'b0;
        #5;
        $display("J = %b K = %b | Q = %b", j, k, q);

        k = 1'b1;
        #5;
        $display("J = %b K = %b | Q = %b", j, k, q);

        k = 1'b0;
        #5;
        $display("J = %b K = %b | Q = %b", j, k, q);

        j = 1'b1;
        #5;
        $display("J = %b K = %b | Q = %b", j, k, q);

        j = 1'b0;
        #5;
        $display("J = %b K = %b | Q = %b", j, k, q);

        j = 1'b1;
        k = 1'b1;
        #5;
        $display("J = %b K = %b | Q = %b", j, k, q);

        j = 1'b0;
        k = 1'b0;
        #5;
        $display("J = %b K = %b | Q = %b", j, k, q);
        $finish;
    end
endmodule