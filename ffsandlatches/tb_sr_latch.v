`timescale 1ns/1ps

module tb_sr_latch();
    reg in_r;
    reg in_s;
    wire q;

    sr_latch uut (
        .in_r(in_r),
        .in_s(in_s),
        .q(q)
    );

    initial begin
        $dumpfile("srlatchwaveform.vcd");
        $dumpvars(0, tb_sr_latch);

        in_r = 0;
        in_s = 0;
        #10;
        $display("S = %d R = %d || Q = %d", in_s, in_r, q);

        in_r = 1;
        #10;
        $display("S = %d R = %d || Q = %d", in_s, in_r, q);

        in_s = 1;
        in_r = 0;
        #10;
        $display("S = %d R = %d || Q = %d", in_s, in_r, q);

        in_r = 1;
        #10;
        $display("S = %d R = %d || Q = %d", in_s, in_r, q);
    end
endmodule