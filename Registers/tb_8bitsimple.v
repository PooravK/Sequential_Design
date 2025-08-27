`timescale 1ns/1ps

module tb_8bitsimple();
    reg clk;
    reg [7:0]D;
    wire [7:0]Q;

    simple8bit register(
        .clk(clk),
        .D(D),
        .Q(Q)
    );

    initial begin
        clk = 1'b0;
        D[7:0] = 8'b0;
        #2;
    end

    always begin
        clk = ~clk;
        #2;
    end

    initial begin
        $dumpfile("simpleregwaveform.vcd");
        $dumpvars(0, tb_8bitsimple);
        
        #5;
        D = 8'd0;
        #5;
        $display("d = %b | q_next = %b", D, Q);
        D = 8'd255;
        #5;
        $display("d = %b | q_next = %b", D, Q);
        D = 8'd0;
        #5;
        $display("d = %b | q_next = %b", D, Q);
        D = 8'd255;
        #5;
        $display("d = %b | q_next = %b", D, Q);
        $finish;
    end
endmodule