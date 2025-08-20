`timescale 1ns/1ps 

module tb_sr_ff;
    reg clk;
    reg s_in;
    reg r_in;
    wire q_out;
    wire q_comp;

    sr_ff uut (
        .clk(clk),
        .s_in(s_in),
        .r_in(r_in),
        .q_out(q_out),
        .q_comp(q_comp)
    );

    initial begin
        clk = 1'b0;
    end

    always begin
        #2 clk = ~clk;
    end

    initial begin
        $dumpfile("srffwaveform.vcd");
        $dumpvars(0, tb_sr_ff);

        r_in = 1'b1; #10; //q_out ki initial value set krne ke liye

        r_in = 1'b0; s_in = 1'b0; #10;
        $display("Clk = %b | S = %b | R = %b | Q = %b Q' = %b", clk, s_in, r_in, q_out, q_comp);

        r_in = 1'b1; #10;
        $display("Clk = %b | S = %b | R = %b | Q = %b Q' = %b", clk, s_in, r_in, q_out, q_comp);

        r_in = 1'b0; s_in = 1; #10;
        $display("Clk = %b | S = %b | R = %b | Q = %b Q' = %b", clk, s_in, r_in, q_out, q_comp);

        r_in = 1'b1; #10;
        $display("Clk = %b | S = %b | R = %b | Q = %b Q' = %b", clk, s_in, r_in, q_out, q_comp);

        r_in = 1'b0; s_in = 1'b0; #10;
        $display("Clk = %b | S = %b | R = %b | Q = %b Q' = %b", clk, s_in, r_in, q_out, q_comp);

        r_in = 1'b1; #10;
        $display("Clk = %b | S = %b | R = %b | Q = %b Q' = %b", clk, s_in, r_in, q_out, q_comp);

        r_in = 1'b0; s_in = 1; #10;
        $display("Clk = %b | S = %b | R = %b | Q = %b Q' = %b", clk, s_in, r_in, q_out, q_comp);

        r_in = 1'b1; #10;
        $display("Clk = %b | S = %b | R = %b | Q = %b Q' = %b", clk, s_in, r_in, q_out, q_comp);

        $finish;
    end
endmodule