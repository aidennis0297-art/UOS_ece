module dac_core(
 input wire clk, rst_n, input wire [5:0] buttons, input wire channel,
 output reg [7:0] dac_data, output wire dac_cs_n, dac_ldac_n,
 output reg dac_wr_n, output wire dac_ab,
 output reg [7:0] value, output reg [1:0] state, output reg [7:0] cnt
);
localparam DELAY=0, SET_WRN=1, UP_DATA=2;
reg [5:0] prev;
wire [5:0] press = buttons & ~prev;
assign dac_cs_n=1'b0;
assign dac_ldac_n=1'b0;
assign dac_ab=channel;
always @(posedge clk or negedge rst_n) begin
 if (!rst_n) begin prev<=0; value<=0; state<=DELAY; cnt<=0; dac_data<=0; dac_wr_n<=1; end
 else begin
  prev<=buttons;
  case (press)
   6'b000001:value<=value-8'd1;
   6'b000010:value<=value+8'd1;
   6'b000100:value<=value-8'd2;
   6'b001000:value<=value+8'd2;
   6'b010000:value<=value-8'd8;
   6'b100000:value<=value+8'd8;
   default:value<=value;
  endcase
  case(state)
   DELAY:begin dac_wr_n<=1; if(cnt==200) begin cnt<=0;state<=SET_WRN;end else cnt<=cnt+1'b1;end
   SET_WRN:begin dac_wr_n<=0; if(cnt==50) begin cnt<=0;state<=UP_DATA;end else cnt<=cnt+1'b1;end
   UP_DATA:begin dac_data<=value; if(cnt==30) begin cnt<=0;state<=DELAY;end else cnt<=cnt+1'b1;end
   default:begin state<=DELAY;cnt<=0;dac_wr_n<=1;end
  endcase
 end
end
endmodule
