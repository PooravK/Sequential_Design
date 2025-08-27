module t_ff(
    input clk, t,
    output reg q
    );

    initial begin
        q = 1'b0; //Agar ye nahi karunga to q hamesha x output dega because usse initially koi value nahi milri
    end

    always @(posedge clk)begin
        q <= q ^ t;
    end
endmodule