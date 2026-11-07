// 1 kHz input clock; display shows the current 8-bit DAC input in decimal.
module dac_e(input clk,rst_n,input [5:0] buttons,input channel,
 output [7:0] dac_data, output dac_cs_n,dac_ldac_n,dac_wr_n,dac_ab,
 output reg [7:0] seg_data,seg_sel,output lcd_rs,lcd_rw,lcd_e,output reg [7:0] lcd_data);
wire [7:0] value,cnt;wire [1:0] state;
dac_core core(clk,rst_n,buttons,channel,dac_data,dac_cs_n,dac_ldac_n,dac_wr_n,dac_ab,value,state,cnt);
reg [2:0] scan; reg [3:0] digit;
always @(posedge clk or negedge rst_n) if(!rst_n) scan<=0;else scan<=scan+1'b1;
always @* begin
 seg_sel=~(8'b1<<scan);
 case(scan)
  0:digit=dac_data%10;
  1:digit=(dac_data/10)%10;
  2:digit=dac_data/100;
  default:digit=10;
 endcase
 case(digit)
  0:seg_data=8'b11111100;1:seg_data=8'b01100000;2:seg_data=8'b11011010;
  3:seg_data=8'b11110010;4:seg_data=8'b01100110;5:seg_data=8'b10110110;
  6:seg_data=8'b10111110;7:seg_data=8'b11100000;8:seg_data=8'b11111110;
  9:seg_data=8'b11110110;default:seg_data=0;
 endcase
end
localparam BOOT=0,FUNCTION_SET=1,DISPLAY_ON=2,ENTRY_MODE=3,ADDR=4,CHARS=5;
reg [2:0] lcd_state;reg [6:0] wait_count;reg [4:0] index;reg [7:0] snapshot;
always @(posedge clk or negedge rst_n) begin
 if(!rst_n) begin lcd_state<=BOOT;wait_count<=0;index<=0;snapshot<=0;end
 else case(lcd_state)
  BOOT: if(wait_count==70) begin wait_count<=0;lcd_state<=FUNCTION_SET;end else wait_count<=wait_count+1'b1;
  FUNCTION_SET,DISPLAY_ON,ENTRY_MODE: if(wait_count==30) begin
   wait_count<=0; lcd_state<=lcd_state+1'b1;
  end else wait_count<=wait_count+1'b1;
  ADDR: begin snapshot<=dac_data;index<=0;lcd_state<=CHARS;end
  CHARS: if(index==15) begin index<=0;lcd_state<=ADDR;end else index<=index+1'b1;
  default:lcd_state<=BOOT;
 endcase
end
assign lcd_rw=0;
assign lcd_rs=(lcd_state==CHARS);
assign lcd_e=~clk && rst_n && (((lcd_state==FUNCTION_SET || lcd_state==DISPLAY_ON || lcd_state==ENTRY_MODE) && wait_count==0) || lcd_state==ADDR || lcd_state==CHARS);
always @* begin
 lcd_data=8'h20;
 case(lcd_state)
 FUNCTION_SET:lcd_data=8'h38;
 DISPLAY_ON:lcd_data=8'h0c;
 ENTRY_MODE:lcd_data=8'h06;
 ADDR:lcd_data=8'h80;
 CHARS:case(index)
  0:lcd_data="D";1:lcd_data="A";2:lcd_data="C";3:lcd_data=":";4:lcd_data=" ";
  5:lcd_data=8'h30+snapshot/100;
  6:lcd_data=8'h30+(snapshot/10)%10;
  7:lcd_data=8'h30+snapshot%10;
  default:lcd_data=8'h20;
 endcase
 default:lcd_data=8'h20;
 endcase
end
endmodule
