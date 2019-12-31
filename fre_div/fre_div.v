//*************************************************************
//Filename    : fre_div.v
//Author      : MaoRen
//Description : Divide frequency by gived parameter
//Created     : 2019-12-17
//*************************************************************

module fre_div (
	clk,
	rst_n,
	clk_d
);

//=====================================
//        Divide Parameter
//=====================================

parameter DIV_NUM = 2;// sub-frequency

//=====================================
//	       IO Declaration
//=====================================

input clk;
input rst_n;
output clk_d; // divided frequency to output 

//=====================================
//     Variable Declaration
//=====================================
//even
reg[3:0] cnt_e; //count to divide with even 
reg      clk_d_e; //clock with even divide parameter
//odd
reg[3:0] cnt1; //count to divide with odd
reg[3:0] cnt2;
reg      clk_d1; //rising edge trigger
reg      clk_d2; //falling edge trigger
wire     clk_d_o; //clock with odd divide parameter duty ratio 50%
//=====================================
//        Divide  Logic 
//=====================================
//***********************
//   DIV_NUM is even
//***********************

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		cnt_e   <= 'b0;
		clk_d_e <= 'b0;
	end
	else if(cnt_e == DIV_NUM/2-1)begin
		cnt_e   <= 'b0;  
		clk_d_e <= ~clk_d_e;
	end
	else begin
		cnt_e   <= cnt_e + 1'b1; 
		clk_d_e <= clk_d_e; 
	end
end
//************************
//   DIV_NUM is odd
//************************
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		cnt1 <= 'b0;
	else if(cnt1 == DIV_NUM - 1)//count DIV_NUM times 
		cnt1 <= 'b0;  //rester counter
	else 
		cnt1 <= cnt1 + 1'b1;
end		
always @(posedge clk or negedge rst_n)begin//rise edge
	if(!rst_n)
		clk_d1 <= 1'b1;
	else if(cnt1 < DIV_NUM / 2) 
		clk_d1 <= 1'b1;
	else
		clk_d1 <= 1'b0;
end		
always @(negedge clk or negedge rst_n)begin
	if(!rst_n)
		cnt2 <= 'b0;
	else if(cnt2 == DIV_NUM - 1)
		cnt2 <= 'b0;
	else 
		cnt2 <= cnt2 + 1'b1;
end		
always @(negedge clk or negedge rst_n)begin//fall edge
	if(!rst_n)
		clk_d2 <= 1'b1;
	else if(cnt2 < DIV_NUM / 2) 
		clk_d2 <= 1'b1;
	else
		clk_d2 <= 1'b0;
end
assign clk_d_o = clk_d1|clk_d2; //duty ratio is 50%
//output clk
assign clk_d = DIV_NUM%2 ? clk_d_o : clk_d_e;

endmodule