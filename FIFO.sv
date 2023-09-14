//a-->write
//b-->read
module FIFO #(
parameter FIFO_WIDTH=16,
parameter FIFO_DEPTH=512
)(
    input [FIFO_WIDTH-1:0]  din_a,
    input wen_a,
    input ren_b,
    input clk_a,
    input clk_b,
    input rst,
    input enable,
    /*When asserted, this signal indicates that the FIFO is
     *full. Write requests are ignored when the FIFO is full*/
    output reg full,
    /*Empty Flag: When asserted, this signal indicates that the FIFO is
     * empty. Read requests are ignored when the FIFO is empty*/
    output reg empty
);

reg [9:0]w_count;
reg [8:0]r_count; 


//queue memory creating.
reg [FIFO_WIDTH-1:0] queue [FIFO_DEPTH-1:0];

//always block for writing.
always @(posedge clk_a) begin
       if (rst) begin
        w_count=0;
        empty=1;
        full=0;
       end
       else if (wen_a==1&&enable==1) begin
            if (!full) begin
            queue[w_count]<=din_a;
            w_count<=w_count+1;
                end
        end
    end
//always block for reading.
always @(posedge clk_b) begin
       if (rst) begin
        r_count=0;
       end
       else if ((!empty)&&(ren_b==1)&&(enable==1)) begin
            r_count<=r_count+1;
        end
end

always @(w_count,r_count) begin
    if ((w_count[8:0]==r_count)) begin
        if (w_count[9]) begin
            full=1;            
        end
        else  begin
            empty=1;
        end
    end
    else begin
        empty=0;
        full=0;
    end
        

end

endmodule //Queue