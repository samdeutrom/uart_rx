`timescale 1ns/1ns

/*
Test bench for uart_tx.sv
*/

module uart_rx_tb(); 

// PARAMETERS 
localparam PERIOD = 10;

logic 		clk;
logic 		rst_n; 
logic       data_i;
logic [7:0] data_o;

// create clock signal
initial begin
	clk <= 0;
	forever #(PERIOD/2) clk = ~clk;
end 

task reset(); 
    begin 
        rst_n <= 1;
        @(posedge clk); rst_n = 0;
        #(PERIOD*5); rst_n = 1;
    end
endtask 


uart_rx MUT (
    .clk(clk),
    .rst_n(rst_n),
    .data_i(data_i),
    .data_o(data_o)
    );
    
initial begin
    // initial setyup
    data_i <= 1; 
    reset();
	#(PERIOD*1000);
    data_i <= 0;
    //data 1
    @(negedge MUT.baud_clk); 
    data_i <= 1;
      //data 2
    @(negedge MUT.baud_clk); 
    data_i <= 0;
      //data 3
    @(negedge MUT.baud_clk); 
    data_i <= 1;
      //data 4
    @(negedge MUT.baud_clk); 
    data_i <= 1;
      //data 5
    @(negedge MUT.baud_clk); 
    data_i <= 1;
      //data 6
    @(negedge MUT.baud_clk); 
    data_i <= 0;
      //data 7
    @(negedge MUT.baud_clk); 
    data_i <= 1;
     //data 8
    @(negedge MUT.baud_clk); 
    data_i <= 0;
    // stop
    @(negedge MUT.baud_clk); 
    data_i <= 1;
    #(PERIOD*10);
    #(PERIOD*10000);
    
	
	$stop();

end

endmodule