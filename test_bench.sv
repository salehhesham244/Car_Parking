class Car_Parking;
     
     randc logic areset;
     randc logic [3:0] password;
     randc logic sens_entrance;
     randc logic sens_exit;

        constraint rst  { areset dist {0:=90,1:=10};}
        constraint pass { password dist {4'd10:=50};}
        constraint sens_en { sens_entrance dist {1:=50,0:=50};}
        constraint sens_ex { sens_exit dist {1:=50,0:=50};}

endclass //Car_Parcking

module test_bench ();
    
    /*The-Object-of-The-Class*/
    Car_Parking car=new;

    /*Signals for DUT*/    
      logic clk,arst;
      logic [3:0]password;
      logic sensor_entrance;  
      logic sensor_exit;
      logic gate,out_exp;  

    /*DUT-Instantiation*/
    Design DUT (clk,arst,password,sensor_entrance,sensor_exit,gate);

    initial begin
        clk=0;
        forever begin
           #1 clk=~clk;
        end
    end

    initial begin
        
        /*Directed-Test*/
        
        /*IDLE-State*/
        arst=1;
        out_exp=0;
        password=0;
        sensor_entrance=0;
        sensor_exit=0;
        check();
        arst=0;
        #10;
        /*WAIT-PASS-State*/
        sensor_entrance=1;
        check();
        /*RIGHT-PASS-State*/
        password=4'b1010;
        out_exp=1;
        sensor_entrance=0;
        check();
        /*Back to IDLE-State*/
        sensor_exit=1;
        password=0;
        out_exp=0;
        check();
        /*WAIT-PASS-State*/
        sensor_entrance=1;
        sensor_exit=0;
        check();
        /*WRONG-PASS-State*/
        password=4'b1000;
        check();
        password=4'b0001;
        check();
        /*RIGHT-PASS-State*/
        password=4'b1010;
        out_exp=1;
        check();
        /*STOP-State*/
        sensor_entrance=1;
        sensor_exit=1;
        password=4'b0000;
        out_exp=0;
        check();
        sensor_entrance=0;
        sensor_exit=0;
        password=4'b0100;
        check();
        /*Back to RIGHT-PASS-State*/
        password=4'b1010;
        out_exp=1;
        check();
        /*Back to IDLE-State*/
        sensor_exit=1;
        password=0;
        out_exp=0;
        check();
    /*==================================================================================================================================================================================*/    
       
        /*Randomized-Test*/

        for (int i=0;i<1000;i++) begin
        /*To make sure that the distribution works well*/
        assert (car.randomize())
        arst=car.areset;
        password=car.password;
        sensor_entrance=car.sens_en;
        sensor_exit=car.sens_ex;
        #10;
        end
        #2 $stop;
    end

    /*Monitor all the signals with it;s values*/
    initial begin
        $monitor ("sensor_entrance=%0d,sensor_exit=%0d,password=%0d,gate=%0d",sensor_entrance,sensor_exit,password,gate);
    end

    /*Task for Self-Checking*/
     task check ();
         repeat(2) @(negedge clk);
         if (out_exp!=gate) begin
             $display("%t:ERROR",$time);
             $stop;
         end
     endtask //check
endmodule