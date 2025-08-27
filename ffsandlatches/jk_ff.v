module jk_ff(
    input clk, j, k,
    output reg q
    );
    initial begin
        q = 1'b0;
    end

    always @(posedge clk)begin
        if (j == 1'b0 && k == 1'b0)begin
            q <= q;
        end else if (j == 1'b0 && k == 1'b1)begin
            q <= 1'b0;
        end else if (j == 1'b1 && k == 1'b0)begin
            q <= 1'b1;
        end else begin
            q <= ~q;
        end
    end
endmodule