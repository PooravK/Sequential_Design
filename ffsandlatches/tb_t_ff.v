`timescale 1ns/1ps

module tb_t_ff();
    reg clk;
    reg t;
    wire q;

    t_ff uut (
        .clk(clk),
        .t(t),
        .q(q)
    );

    initial begin
        clk = 1'b0;
        #2;
    end

    always begin
        clk = ~clk;
        #2;
    end

    initial begin
        $dumpfile("tffwaveform.vcd");
        $dumpvars(0, tb_t_ff);

        t = 0; #5;
        $display("T = %b | Q Next = %b", t, q);
        t = 1; #5;
        $display("T = %b | Q Next = %b", t, q);
        t = 0; #5;
        $display("T = %b | Q Next = %b", t, q);
        t = 1; #5;
        $display("T = %b | Q Next = %b", t, q);
        $finish;
    end
endmodule