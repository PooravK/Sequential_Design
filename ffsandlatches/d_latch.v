//D latch aur D flip flop me bas itna antar hai ki latch level triggered hai aur enable se kaam krta hai, meanwhile D flip flop edge triggered hota hai aur rising edge pe kaam krega if posedge

module d_latch(
    input d_in, en_in,
    output reg q_out,
    output q_comp
    );

    assign q_comp = ~(q_out);

    always @(*)begin //Modern solution hai verilog ka, taki sare inputs nahi likhne pade
        if (en_in == 1)begin
            q_out <= d_in;
        end
    end
endmodule

//Agar mai bas en_in krdeta pehle ki tarah, to ye edge triggered ban jata. Always block tab hi run krta jab en_in 0-1 ya fir 1-0 hora hota isliye sare inputs include krne hote hai always block ke sensitivity list me
//always @(d_in or en_in)