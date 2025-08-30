`timescale 1ns/1ps

module tb_sync_loadclearreg();
    reg clear;
    reg load;
    reg clk;
    reg [7:0]D;
    wire [7:0]Qout;

    sync_loadclearreg register(
        .clear(clear),
        .load(load),
        .clk(clk),
        .D(D),
        .Qout(Qout)
    );

    initial begin
        clear = 1'b1;
        load = 1'b0;
        clk = 1'b0;
        #5;
    end

    always begin
        clk = ~clk;
        #2;
    end

    initial begin
        $dumpfile("improvedregwaveform.vcd");
        $dumpvars(0, tb_sync_loadclearreg);

        #5;
        load = 1'b1;
        #5;
        $display("LOAD = %d | CLEAR = %d | D = %d | Qout = %d |", load, clear, D, Qout);

        D = 8'd0;
        #5;
        $display("LOAD = %d | CLEAR = %d | D = %d | Qout = %d |", load, clear, D, Qout);

        #5;
        D = 8'd255;
        #5;
        $display("LOAD = %d | CLEAR = %d | D = %d | Qout = %d |", load, clear, D, Qout);

        clear = 1'b0;
        #5;
        $display("LOAD = %d | CLEAR = %d | D = %d | Qout = %d |", load, clear, D, Qout);

        D = 8'd128;
        #5;
        $display("LOAD = %d | CLEAR = %d | D = %d | Qout = %d |", load, clear, D, Qout);

        clear = 1'b1;
        #5;
        $display("LOAD = %d | CLEAR = %d | D = %d | Qout = %d |", load, clear, D, Qout);

        load = 1'b0;
        #5;
        $display("LOAD = %d | CLEAR = %d | D = %d | Qout = %d |", load, clear, D, Qout);

        D = 8'd69;
        #5;
        $display("LOAD = %d | CLEAR = %d | D = %d | Qout = %d |", load, clear, D, Qout);

        load = 1'b0;
        clear = 1'b1;
        #5
        $display("LOAD = %d | CLEAR = %d | D = %d | Qout = %d |", load, clear, D, Qout);
        $finish;
    end
endmodule