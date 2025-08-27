module d_ff(
    input clk, d,
    output reg q_next
    );

    always @(posedge clk)begin
        q_next <= d;
    end
endmodule