module simple8bit(
    input clk,
    input [7:0]D,
    output reg [7:0]Q
    );

    always @(posedge clk)begin
        Q[7:0] <= D[7:0];
    end
endmodule