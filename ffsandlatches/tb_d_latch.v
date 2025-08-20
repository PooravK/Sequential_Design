`timescale 1ns/1ps 

module tb_d_latch;
    reg en_in;
    reg d_in;
    wire q_out;
    wire q_comp;

    d_latch uut (
        .en_in(en_in),
        .d_in(d_in),
        .q_out(q_out),
        .q_comp(q_comp)
    );

    initial begin
        $dumpfile("srffwaveform.vcd");
        $dumpvars(0, tb_d_latch);

        en_in = 1'b0; #10;

        d_in = 1'b0; #10;
        $display("en = %b | d = %b | q = %b q' = %b", en_in, d_in, q_out, q_comp);

        d_in = 1'b1; #10;
        $display("en = %b | d = %b | q = %b q' = %b", en_in, d_in, q_out, q_comp);

        en_in = 1'b1; #10;
        $display("en = %b | d = %b | q = %b q' = %b", en_in, d_in, q_out, q_comp);

        d_in = 1'b0; #10;
        $display("en = %b | d = %b | q = %b q' = %b", en_in, d_in, q_out, q_comp);

        d_in = 1'b1; #10;
        $display("en = %b | d = %b | q = %b q' = %b", en_in, d_in, q_out, q_comp);
        $finish;
    end
endmodule