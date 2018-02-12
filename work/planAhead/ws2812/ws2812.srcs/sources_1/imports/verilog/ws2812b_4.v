/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module ws2812b_4 (
    input clk,
    input rst,
    input [3:0] paddle,
    input [7:0] ball,
    input [7:0] secondball,
    input [127:0] brick,
    output reg datain,
    input [1:0] playing,
    input [311:0] gamestart,
    input [191:0] gameover
  );
  
  
  
  reg [6:0] value;
  
  reg [6:0] M_timecounter_d, M_timecounter_q = 1'h0;
  reg [12:0] M_tbitcounter_d, M_tbitcounter_q = 1'h0;
  reg [4:0] M_bitcounter_d, M_bitcounter_q = 1'h0;
  reg [3:0] M_paddlecounter_d, M_paddlecounter_q = 1'h0;
  reg [2:0] M_paddlelencounter_d, M_paddlelencounter_q = 1'h0;
  reg [7:0] M_ballcounter_d, M_ballcounter_q = 1'h0;
  reg [7:0] M_secondballcounter_d, M_secondballcounter_q = 1'h0;
  reg [7:0] M_gamestartcounter_d, M_gamestartcounter_q = 1'h0;
  reg [7:0] M_gameovercounter_d, M_gameovercounter_q = 1'h0;
  reg [7:0] M_brickcounter_d, M_brickcounter_q = 1'h0;
  reg M_bit_d, M_bit_q = 1'h0;
  reg [16:0] M_pause_d, M_pause_q = 1'h0;
  localparam GSONELOW_state = 6'd0;
  localparam GSZEROLOW_state = 6'd1;
  localparam GSGREENONELOW_state = 6'd2;
  localparam GSGREENONEHIGH_state = 6'd3;
  localparam GSGREENZEROLOW_state = 6'd4;
  localparam GSGREENZEROHIGH_state = 6'd5;
  localparam PONELOW_state = 6'd6;
  localparam PZEROLOW_state = 6'd7;
  localparam PONEHIGH_state = 6'd8;
  localparam PZEROHIGH_state = 6'd9;
  localparam BONELOW_state = 6'd10;
  localparam BZEROLOW_state = 6'd11;
  localparam BREDONELOW_state = 6'd12;
  localparam BREDONEHIGH_state = 6'd13;
  localparam BREDZEROLOW_state = 6'd14;
  localparam BREDZEROHIGH_state = 6'd15;
  localparam BBLUEONELOW_state = 6'd16;
  localparam BBLUEONEHIGH_state = 6'd17;
  localparam BBLUEZEROLOW_state = 6'd18;
  localparam BBLUEZEROHIGH_state = 6'd19;
  localparam SPONELOW_state = 6'd20;
  localparam SPZEROLOW_state = 6'd21;
  localparam SPONEHIGH_state = 6'd22;
  localparam SPZEROHIGH_state = 6'd23;
  localparam SBONELOW_state = 6'd24;
  localparam SBZEROLOW_state = 6'd25;
  localparam SBREDONELOW_state = 6'd26;
  localparam SBREDONEHIGH_state = 6'd27;
  localparam SBREDZEROLOW_state = 6'd28;
  localparam SBREDZEROHIGH_state = 6'd29;
  localparam SBBLUEONELOW_state = 6'd30;
  localparam SBBLUEONEHIGH_state = 6'd31;
  localparam SBBLUEZEROLOW_state = 6'd32;
  localparam SBBLUEZEROHIGH_state = 6'd33;
  localparam GOONELOW_state = 6'd34;
  localparam GOZEROLOW_state = 6'd35;
  localparam GOREDONELOW_state = 6'd36;
  localparam GOREDONEHIGH_state = 6'd37;
  localparam GOREDZEROLOW_state = 6'd38;
  localparam GOREDZEROHIGH_state = 6'd39;
  localparam PAUSE_state = 6'd40;
  
  reg [5:0] M_state_d, M_state_q = GSONELOW_state;
  
  always @* begin
    M_state_d = M_state_q;
    M_pause_d = M_pause_q;
    M_bit_d = M_bit_q;
    M_paddlelencounter_d = M_paddlelencounter_q;
    M_paddlecounter_d = M_paddlecounter_q;
    M_secondballcounter_d = M_secondballcounter_q;
    M_brickcounter_d = M_brickcounter_q;
    M_gameovercounter_d = M_gameovercounter_q;
    M_ballcounter_d = M_ballcounter_q;
    M_bitcounter_d = M_bitcounter_q;
    M_gamestartcounter_d = M_gamestartcounter_q;
    M_tbitcounter_d = M_tbitcounter_q;
    M_timecounter_d = M_timecounter_q;
    
    value = 6'h2d;
    
    case (M_state_q)
      GSONELOW_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = GSZEROLOW_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          M_gamestartcounter_d = M_gamestartcounter_q + 1'h1;
          M_bitcounter_d = 1'h0;
        end
        if (M_tbitcounter_q == 13'h1800) begin
          M_state_d = PAUSE_state;
        end
        if (M_gamestartcounter_q == gamestart[0+7-:8] || M_gamestartcounter_q == gamestart[8+7-:8] || M_gamestartcounter_q == gamestart[16+7-:8] || M_gamestartcounter_q == gamestart[24+7-:8] || M_gamestartcounter_q == gamestart[32+7-:8] || M_gamestartcounter_q == gamestart[40+7-:8] || M_gamestartcounter_q == gamestart[48+7-:8] || M_gamestartcounter_q == gamestart[56+7-:8] || M_gamestartcounter_q == gamestart[64+7-:8] || M_gamestartcounter_q == gamestart[72+7-:8] || M_gamestartcounter_q == gamestart[80+7-:8] || M_gamestartcounter_q == gamestart[88+7-:8] || M_gamestartcounter_q == gamestart[96+7-:8] || M_gamestartcounter_q == gamestart[104+7-:8] || M_gamestartcounter_q == gamestart[112+7-:8] || M_gamestartcounter_q == gamestart[120+7-:8] || M_gamestartcounter_q == gamestart[128+7-:8] || M_gamestartcounter_q == gamestart[136+7-:8] || M_gamestartcounter_q == gamestart[144+7-:8] || M_gamestartcounter_q == gamestart[152+7-:8] || M_gamestartcounter_q == gamestart[160+7-:8] || M_gamestartcounter_q == gamestart[168+7-:8] || M_gamestartcounter_q == gamestart[176+7-:8] || M_gamestartcounter_q == gamestart[184+7-:8] || M_gamestartcounter_q == gamestart[192+7-:8] || M_gamestartcounter_q == gamestart[200+7-:8] || M_gamestartcounter_q == gamestart[208+7-:8] || M_gamestartcounter_q == gamestart[216+7-:8] || M_gamestartcounter_q == gamestart[224+7-:8] || M_gamestartcounter_q == gamestart[232+7-:8] || M_gamestartcounter_q == gamestart[240+7-:8] || M_gamestartcounter_q == gamestart[248+7-:8] || M_gamestartcounter_q == gamestart[256+7-:8] || M_gamestartcounter_q == gamestart[264+7-:8] || M_gamestartcounter_q == gamestart[272+7-:8] || M_gamestartcounter_q == gamestart[280+7-:8] || M_gamestartcounter_q == gamestart[288+7-:8] || M_gamestartcounter_q == gamestart[296+7-:8] || M_gamestartcounter_q == gamestart[304+7-:8]) begin
          M_state_d = GSGREENONELOW_state;
        end
      end
      GSZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = GSONELOW_state;
        end
      end
      GSGREENONELOW_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = GSGREENZEROLOW_state;
        end
        if (M_bitcounter_q == 1'h0) begin
          M_state_d = GSGREENONEHIGH_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          M_bitcounter_d = 1'h0;
          M_gamestartcounter_d = M_gamestartcounter_q + 1'h1;
          M_state_d = GSONELOW_state;
        end
      end
      GSGREENZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = GSGREENONELOW_state;
        end
      end
      GSGREENONEHIGH_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > value) begin
          M_state_d = GSGREENZEROHIGH_state;
        end
        if (M_bitcounter_q == 4'h9) begin
          M_state_d = GSGREENONELOW_state;
        end
      end
      GSGREENZEROHIGH_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = GSGREENONEHIGH_state;
        end
      end
      PONELOW_state: begin
        M_bit_d = 1'h1;
        M_ballcounter_d = 5'h10;
        M_brickcounter_d = 5'h10;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = PZEROLOW_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          M_paddlecounter_d = M_paddlecounter_q + 1'h1;
          M_bitcounter_d = 1'h0;
        end
        if (M_paddlecounter_q == paddle) begin
          M_state_d = PONEHIGH_state;
        end
        if (M_tbitcounter_q == 9'h180) begin
          M_bitcounter_d = 1'h0;
          M_state_d = BONELOW_state;
        end
      end
      PZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = PONELOW_state;
        end
      end
      PONEHIGH_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > value) begin
          M_state_d = PZEROHIGH_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          M_paddlecounter_d = M_paddlecounter_q + 1'h1;
          M_paddlelencounter_d = M_paddlelencounter_q + 1'h1;
          M_bitcounter_d = 1'h0;
        end
        if (M_paddlelencounter_q == 3'h4) begin
          M_paddlelencounter_d = 1'h0;
          M_state_d = PONELOW_state;
        end
      end
      PZEROHIGH_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = PONEHIGH_state;
        end
      end
      BONELOW_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = BZEROLOW_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          M_ballcounter_d = M_ballcounter_q + 1'h1;
          M_brickcounter_d = M_brickcounter_q + 1'h1;
          M_bitcounter_d = 1'h0;
        end
        if (M_tbitcounter_q == 13'h1800) begin
          M_state_d = PAUSE_state;
        end
        if (M_ballcounter_q == ball) begin
          M_state_d = BREDONELOW_state;
        end
        if (M_brickcounter_q == brick[0+7-:8] || M_brickcounter_q == brick[8+7-:8] || M_brickcounter_q == brick[16+7-:8] || M_brickcounter_q == brick[24+7-:8] || M_brickcounter_q == brick[32+7-:8] || M_brickcounter_q == brick[40+7-:8] || M_brickcounter_q == brick[48+7-:8] || M_brickcounter_q == brick[56+7-:8] || M_brickcounter_q == brick[64+7-:8] || M_brickcounter_q == brick[72+7-:8] || M_brickcounter_q == brick[80+7-:8] || M_brickcounter_q == brick[88+7-:8] || M_brickcounter_q == brick[96+7-:8] || M_brickcounter_q == brick[104+7-:8] || M_brickcounter_q == brick[112+7-:8] || M_brickcounter_q == brick[120+7-:8]) begin
          M_state_d = BBLUEONELOW_state;
        end
      end
      BZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = BONELOW_state;
        end
      end
      BREDONELOW_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = BREDZEROLOW_state;
        end
        if (M_bitcounter_q == 4'h9) begin
          M_state_d = BREDONEHIGH_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          if (M_brickcounter_q == M_ballcounter_q) begin
            M_brickcounter_d = M_brickcounter_q + 1'h1;
          end
          M_bitcounter_d = 1'h0;
          M_ballcounter_d = M_ballcounter_q + 1'h1;
          M_state_d = BONELOW_state;
        end
      end
      BREDZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = BREDONELOW_state;
        end
      end
      BREDONEHIGH_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > value) begin
          M_state_d = BREDZEROHIGH_state;
        end
        if (M_bitcounter_q == 5'h11) begin
          M_state_d = BREDONELOW_state;
        end
      end
      BREDZEROHIGH_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = BREDONEHIGH_state;
        end
      end
      BBLUEONELOW_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = BBLUEZEROLOW_state;
        end
        if (M_bitcounter_q == 5'h11) begin
          M_state_d = BBLUEONEHIGH_state;
        end
      end
      BBLUEZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = BBLUEONELOW_state;
        end
      end
      BBLUEONEHIGH_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > value) begin
          M_state_d = BBLUEZEROHIGH_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          if (M_brickcounter_q == M_ballcounter_q) begin
            M_ballcounter_d = M_ballcounter_q + 1'h1;
          end
          M_bitcounter_d = 1'h0;
          M_brickcounter_d = M_brickcounter_q + 1'h1;
          M_state_d = BONELOW_state;
        end
      end
      BBLUEZEROHIGH_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = BBLUEONEHIGH_state;
        end
      end
      SPONELOW_state: begin
        M_bit_d = 1'h1;
        M_ballcounter_d = 5'h10;
        M_secondballcounter_d = 5'h10;
        M_brickcounter_d = 5'h10;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = SPZEROLOW_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          M_paddlecounter_d = M_paddlecounter_q + 1'h1;
          M_bitcounter_d = 1'h0;
        end
        if (M_paddlecounter_q == paddle) begin
          M_state_d = SPONEHIGH_state;
        end
        if (M_tbitcounter_q == 9'h180) begin
          M_bitcounter_d = 1'h0;
          M_state_d = SBONELOW_state;
        end
      end
      SPZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = SPONELOW_state;
        end
      end
      SPONEHIGH_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > value) begin
          M_state_d = SPZEROHIGH_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          M_paddlecounter_d = M_paddlecounter_q + 1'h1;
          M_paddlelencounter_d = M_paddlelencounter_q + 1'h1;
          M_bitcounter_d = 1'h0;
        end
        if (M_paddlelencounter_q == 3'h4) begin
          M_paddlelencounter_d = 1'h0;
          M_state_d = SPONELOW_state;
        end
      end
      SPZEROHIGH_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = SPONEHIGH_state;
        end
      end
      SBONELOW_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = SBZEROLOW_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          M_secondballcounter_d = M_secondballcounter_q + 1'h1;
          M_ballcounter_d = M_ballcounter_q + 1'h1;
          M_brickcounter_d = M_brickcounter_q + 1'h1;
          M_bitcounter_d = 1'h0;
        end
        if (M_tbitcounter_q == 13'h1800) begin
          M_state_d = PAUSE_state;
        end
        if (M_ballcounter_q == ball || M_secondballcounter_q == secondball) begin
          M_state_d = SBREDONELOW_state;
        end
        if (M_brickcounter_q == brick[0+7-:8] || M_brickcounter_q == brick[8+7-:8] || M_brickcounter_q == brick[16+7-:8] || M_brickcounter_q == brick[24+7-:8] || M_brickcounter_q == brick[32+7-:8] || M_brickcounter_q == brick[40+7-:8] || M_brickcounter_q == brick[48+7-:8] || M_brickcounter_q == brick[56+7-:8] || M_brickcounter_q == brick[64+7-:8] || M_brickcounter_q == brick[72+7-:8] || M_brickcounter_q == brick[80+7-:8] || M_brickcounter_q == brick[88+7-:8] || M_brickcounter_q == brick[96+7-:8] || M_brickcounter_q == brick[104+7-:8] || M_brickcounter_q == brick[112+7-:8] || M_brickcounter_q == brick[120+7-:8]) begin
          M_state_d = SBBLUEONELOW_state;
        end
      end
      SBZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = SBONELOW_state;
        end
      end
      SBREDONELOW_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = SBREDZEROLOW_state;
        end
        if (M_bitcounter_q == 4'h9) begin
          M_state_d = SBREDONEHIGH_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          if (M_brickcounter_q == M_ballcounter_q || M_brickcounter_q == M_secondballcounter_q) begin
            M_brickcounter_d = M_brickcounter_q + 1'h1;
          end
          M_bitcounter_d = 1'h0;
          M_ballcounter_d = M_ballcounter_q + 1'h1;
          M_secondballcounter_d = M_secondballcounter_q + 1'h1;
          M_state_d = SBONELOW_state;
        end
      end
      SBREDZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = SBREDONELOW_state;
        end
      end
      SBREDONEHIGH_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > value) begin
          M_state_d = SBREDZEROHIGH_state;
        end
        if (M_bitcounter_q == 5'h11) begin
          M_state_d = SBREDONELOW_state;
        end
      end
      SBREDZEROHIGH_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = SBREDONEHIGH_state;
        end
      end
      SBBLUEONELOW_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = SBBLUEZEROLOW_state;
        end
        if (M_bitcounter_q == 5'h11) begin
          M_state_d = SBBLUEONEHIGH_state;
        end
      end
      SBBLUEZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = SBBLUEONELOW_state;
        end
      end
      SBBLUEONEHIGH_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > value) begin
          M_state_d = SBBLUEZEROHIGH_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          if (M_brickcounter_q == M_ballcounter_q) begin
            M_ballcounter_d = M_ballcounter_q + 1'h1;
          end
          if (M_brickcounter_q == M_secondballcounter_q) begin
            M_secondballcounter_d = M_secondballcounter_q + 1'h1;
          end
          M_bitcounter_d = 1'h0;
          M_brickcounter_d = M_brickcounter_q + 1'h1;
          M_state_d = SBONELOW_state;
        end
      end
      SBBLUEZEROHIGH_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = SBBLUEONEHIGH_state;
        end
      end
      GOONELOW_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = GOZEROLOW_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          M_gameovercounter_d = M_gameovercounter_q + 1'h1;
          M_bitcounter_d = 1'h0;
        end
        if (M_tbitcounter_q == 13'h1800) begin
          M_state_d = PAUSE_state;
        end
        if (M_gameovercounter_q == gameover[0+7-:8] || M_gameovercounter_q == gameover[8+7-:8] || M_gameovercounter_q == gameover[16+7-:8] || M_gameovercounter_q == gameover[24+7-:8] || M_gameovercounter_q == gameover[32+7-:8] || M_gameovercounter_q == gameover[40+7-:8] || M_gameovercounter_q == gameover[48+7-:8] || M_gameovercounter_q == gameover[56+7-:8] || M_gameovercounter_q == gameover[64+7-:8] || M_gameovercounter_q == gameover[72+7-:8] || M_gameovercounter_q == gameover[80+7-:8] || M_gameovercounter_q == gameover[88+7-:8] || M_gameovercounter_q == gameover[96+7-:8] || M_gameovercounter_q == gameover[104+7-:8] || M_gameovercounter_q == gameover[112+7-:8] || M_gameovercounter_q == gameover[120+7-:8] || M_gameovercounter_q == gameover[128+7-:8] || M_gameovercounter_q == gameover[136+7-:8] || M_gameovercounter_q == gameover[144+7-:8] || M_gameovercounter_q == gameover[152+7-:8] || M_gameovercounter_q == gameover[160+7-:8] || M_gameovercounter_q == gameover[168+7-:8] || M_gameovercounter_q == gameover[176+7-:8] || M_gameovercounter_q == gameover[184+7-:8]) begin
          M_state_d = GOREDONELOW_state;
        end
      end
      GOZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = GOONELOW_state;
        end
      end
      GOREDONELOW_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > 5'h11) begin
          M_state_d = GOREDZEROLOW_state;
        end
        if (M_bitcounter_q == 4'h9) begin
          M_state_d = GOREDONEHIGH_state;
        end
        if (M_bitcounter_q == 5'h18) begin
          M_bitcounter_d = 1'h0;
          M_gameovercounter_d = M_gameovercounter_q + 1'h1;
          M_state_d = GOONELOW_state;
        end
      end
      GOREDZEROLOW_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = GOREDONELOW_state;
        end
      end
      GOREDONEHIGH_state: begin
        M_bit_d = 1'h1;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q > value) begin
          M_state_d = GOREDZEROHIGH_state;
        end
        if (M_bitcounter_q == 5'h11) begin
          M_state_d = GOREDONELOW_state;
        end
      end
      GOREDZEROHIGH_state: begin
        M_bit_d = 1'h0;
        M_timecounter_d = M_timecounter_q + 1'h1;
        if (M_timecounter_q == 6'h3e) begin
          M_tbitcounter_d = M_tbitcounter_q + 1'h1;
          M_bitcounter_d = M_bitcounter_q + 1'h1;
          M_timecounter_d = 1'h0;
          M_state_d = GOREDONEHIGH_state;
        end
      end
      PAUSE_state: begin
        M_bit_d = 1'h0;
        M_pause_d = M_pause_q + 1'h1;
        if (M_pause_q[16+0-:1] == 1'h1) begin
          M_tbitcounter_d = 1'h0;
          M_pause_d = 1'h0;
          M_timecounter_d = 1'h0;
          if (playing == 2'h0) begin
            M_state_d = GSONELOW_state;
          end
          if (playing == 2'h1) begin
            M_state_d = PONELOW_state;
          end
          if (playing == 2'h2) begin
            M_state_d = SPONELOW_state;
          end
          if (playing == 2'h3) begin
            M_state_d = GOONELOW_state;
          end
        end
      end
    endcase
    datain = M_bit_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_timecounter_q <= 1'h0;
      M_tbitcounter_q <= 1'h0;
      M_bitcounter_q <= 1'h0;
      M_paddlecounter_q <= 1'h0;
      M_paddlelencounter_q <= 1'h0;
      M_ballcounter_q <= 1'h0;
      M_secondballcounter_q <= 1'h0;
      M_gamestartcounter_q <= 1'h0;
      M_gameovercounter_q <= 1'h0;
      M_brickcounter_q <= 1'h0;
      M_bit_q <= 1'h0;
      M_pause_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_timecounter_q <= M_timecounter_d;
      M_tbitcounter_q <= M_tbitcounter_d;
      M_bitcounter_q <= M_bitcounter_d;
      M_paddlecounter_q <= M_paddlecounter_d;
      M_paddlelencounter_q <= M_paddlelencounter_d;
      M_ballcounter_q <= M_ballcounter_d;
      M_secondballcounter_q <= M_secondballcounter_d;
      M_gamestartcounter_q <= M_gamestartcounter_d;
      M_gameovercounter_q <= M_gameovercounter_d;
      M_brickcounter_q <= M_brickcounter_d;
      M_bit_q <= M_bit_d;
      M_pause_q <= M_pause_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
