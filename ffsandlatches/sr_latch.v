module sr_latch(
    input in_s, in_r,
    output reg q
    );

    always @(in_r or in_s)begin
        q <= 1'b0;

        if (in_r == 1)begin //reset agar in_r 1 hai
            q <= 1'b0;
        end else if (in_s == 1)begin //set agar in_s 1 hai
            q <= 1'b1;
        end
    end
endmodule