module SISO(
    input clk, load, clear,
    input s_in,
    output reg s_out
    );

    reg [7:0]data_shift;

    always @(posedge clk or negedge clear)begin

        if (~clear)begin
            data_shift <= 8'b0;
            s_out <= 1'b0;
        end else if (load)begin
            data_shift <= {s_in, data_shift[7:1]};
            s_out <= data_shift[0];
        end
    end
endmodule

//Ye hai hamara synchronous SISO with active high load and active low clear
//Yaha pe jo main funda hai vo hai ki we utilize the always which is an infinitely running loop
//Jiski wajah se we use concatenation operator taaki jo LSB hai vo shift ho jaye and MSB concatenate ho jaye aage
//Jo last ki bit shift hori hoti hai, usse ham finally output me bit by bit dikha dete hai, hence the name Serial out