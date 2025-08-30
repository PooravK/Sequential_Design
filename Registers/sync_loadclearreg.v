module sync_loadclearreg(
    input load, clear, clk,
    input [7:0]D,
    output reg [7:0]Qout
    );

    always @(posedge clk)begin
        if (load)begin //Load hai hamara active high
            Qout <= D;
        end else if (~clear)begin //clear hai hamara active low
            Qout <= 8'b0;
        end
    end
endmodule


//Ye wala register ek step upar liya hai
//Load: Jab ye on hoga tab hi register new values lega
//Jab na hi load hai na hi clear tab register hold me chala jaega
//Jab clear on hai to register ki previous memory clear ho jaegi