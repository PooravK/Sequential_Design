module sr_ff(
    input clk, s_in, r_in,
    output reg q_out,
    output q_comp
    );

    assign q_comp = ~(q_out);

    always @(posedge clk)begin

        if (r_in == 1'b1)begin
            q_out <= 1'b0;
        end else if (s_in == 1'b1)begin
            q_out <= 1'b1;
        end
    end
endmodule