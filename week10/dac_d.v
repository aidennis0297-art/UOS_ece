module dac_d(input clk, rst_n, input [5:0] buttons, input channel,
 output [7:0] dac_data, output dac_cs_n,dac_ldac_n,dac_wr_n,dac_ab);
wire [7:0] value,cnt; wire [1:0] state;
dac_core core(clk,rst_n,buttons,channel,dac_data,dac_cs_n,dac_ldac_n,dac_wr_n,dac_ab,value,state,cnt);
endmodule
