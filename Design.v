module Design #(       
       parameter password=10,//the password of the parking.
       parameter IDLE=3'b000,//ideal state.
       parameter WAIT_PASS=3'b001,//getting password state.
       parameter WRONG_PASS=3'b011,//wrong password state.
       parameter RIGHT_PASS=3'b010,//correct password state.
       parameter STOP=3'b100//stop state if both cai in and out simulatanously.
) (
    input  clk,
    input  arst,
    input  [3:0] pass,
    input  sensor_entrance,
    input  sensor_exit,
    output reg gate ,LED_Green,LED_RED

);

reg [2:0]cs,ns;


/*State-Memory*/
always @(posedge clk or posedge arst) begin
    if (arst) begin
        cs=IDLE;
        gate=0;
        LED_Green=0;
        LED_RED=0;
    end
    else begin
        cs<=ns;
    end
end
    
/*Next-State-Logic*/
always @(cs,pass,sensor_entrance,sensor_exit) begin
   case (cs)
    IDLE:begin
        if (sensor_entrance) begin
            ns=WAIT_PASS;
        end
    end
    WAIT_PASS:begin
        if (pass==password) begin
            ns=RIGHT_PASS;
        end
        else begin
            ns=WRONG_PASS;
        end
    end
    RIGHT_PASS:begin
        if (sensor_entrance&&sensor_exit) begin
            ns=STOP;
        end
        else if (sensor_exit) begin
            ns=IDLE;
        end
        else begin
            ns=RIGHT_PASS;
        end
    end
    WRONG_PASS:begin
        if (pass==password) begin
            ns=RIGHT_PASS;
        end
        else begin
            ns=WRONG_PASS;
        end
    end
    STOP:begin
        if (pass==password) begin
            ns=RIGHT_PASS;
        end
        else begin
            ns=STOP;
        end
    end
    default : ns=IDLE;

   endcase


end

/*OutPut-State-Logic(With moore method)*/
always @(cs) begin
  if (cs==RIGHT_PASS) begin
        gate=1;
        LED_Green=1;
        LED_RED=0;
    end
    else begin
        gate=0;
        LED_Green=0;
        LED_RED=0;
    end
    if (cs==STOP||cs==WRONG_PASS) begin
        LED_RED=1;
        LED_Green=0;
    end
  end

/*OutPut-State-Logic(with meely method)*/
// always @(cs,pass) begin
//   if ((cs==WAIT_PASS)||(cs==STOP)) begin
//     if (pass==password) begin
//         gate=1;
//         LED_Green=1;
//         LED_RED=0;
//     end
//     else begin
//         gate=0;
//         LED_RED=1;
//         LED_Green=0;
//     end
//   end
//   else begin
//     gate=0;
//     LED_Green=0;
//     LED_RED=0;
//   end  
// end

endmodule