/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg dataOut,
    input [4:0] io_button,
    output reg [23:0] io_led,
    input lb,
    input rb
  );
  
  
  
  reg rst;
  
  wire [4-1:0] M_mypc_out;
  reg [1-1:0] M_mypc_rst;
  reg [1-1:0] M_mypc_lb;
  reg [1-1:0] M_mypc_rb;
  playercontrol_1 mypc (
    .clk(clk),
    .rst(M_mypc_rst),
    .lb(M_mypc_lb),
    .rb(M_mypc_rb),
    .out(M_mypc_out)
  );
  wire [8-1:0] M_myball_ballpos;
  wire [4-1:0] M_myball_ballposx;
  wire [4-1:0] M_myball_ballposy;
  wire [1-1:0] M_myball_endgame;
  reg [1-1:0] M_myball_rst;
  reg [4-1:0] M_myball_paddlepos;
  reg [2-1:0] M_myball_playing;
  ballcontrol_2 myball (
    .clk(clk),
    .rst(M_myball_rst),
    .paddlepos(M_myball_paddlepos),
    .playing(M_myball_playing),
    .ballpos(M_myball_ballpos),
    .ballposx(M_myball_ballposx),
    .ballposy(M_myball_ballposy),
    .endgame(M_myball_endgame)
  );
  wire [8-1:0] M_myballtwo_ballpos;
  wire [4-1:0] M_myballtwo_ballposx;
  wire [4-1:0] M_myballtwo_ballposy;
  wire [1-1:0] M_myballtwo_endgame;
  reg [1-1:0] M_myballtwo_rst;
  reg [4-1:0] M_myballtwo_paddlepos;
  reg [2-1:0] M_myballtwo_playing;
  secondballcontrol_3 myballtwo (
    .clk(clk),
    .rst(M_myballtwo_rst),
    .paddlepos(M_myballtwo_paddlepos),
    .playing(M_myballtwo_playing),
    .ballpos(M_myballtwo_ballpos),
    .ballposx(M_myballtwo_ballposx),
    .ballposy(M_myballtwo_ballposy),
    .endgame(M_myballtwo_endgame)
  );
  wire [1-1:0] M_myws_datain;
  reg [1-1:0] M_myws_rst;
  reg [4-1:0] M_myws_paddle;
  reg [8-1:0] M_myws_ball;
  reg [8-1:0] M_myws_secondball;
  reg [128-1:0] M_myws_brick;
  reg [2-1:0] M_myws_playing;
  reg [312-1:0] M_myws_gamestart;
  reg [192-1:0] M_myws_gameover;
  ws2812b_4 myws (
    .clk(clk),
    .rst(M_myws_rst),
    .paddle(M_myws_paddle),
    .ball(M_myws_ball),
    .secondball(M_myws_secondball),
    .brick(M_myws_brick),
    .playing(M_myws_playing),
    .gamestart(M_myws_gamestart),
    .gameover(M_myws_gameover),
    .datain(M_myws_datain)
  );
  wire [128-1:0] M_mybrick_brickpos;
  wire [1-1:0] M_mybrick_endgame;
  reg [1-1:0] M_mybrick_rst;
  reg [8-1:0] M_mybrick_ballpos;
  reg [8-1:0] M_mybrick_secondballpos;
  reg [2-1:0] M_mybrick_playing;
  brickgen_5 mybrick (
    .clk(clk),
    .rst(M_mybrick_rst),
    .ballpos(M_mybrick_ballpos),
    .secondballpos(M_mybrick_secondballpos),
    .playing(M_mybrick_playing),
    .brickpos(M_mybrick_brickpos),
    .endgame(M_mybrick_endgame)
  );
  wire [312-1:0] M_mygs_gamestart;
  reg [1-1:0] M_mygs_rst;
  gamestart_6 mygs (
    .clk(clk),
    .rst(M_mygs_rst),
    .gamestart(M_mygs_gamestart)
  );
  wire [192-1:0] M_mygo_gameover;
  reg [1-1:0] M_mygo_rst;
  gameover_7 mygo (
    .clk(clk),
    .rst(M_mygo_rst),
    .gameover(M_mygo_gameover)
  );
  reg [1:0] M_playing_d, M_playing_q = 1'h0;
  localparam GAMESTART_state = 2'd0;
  localparam PLAYING_state = 2'd1;
  localparam PLAYTWO_state = 2'd2;
  localparam GAMEOVER_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = GAMESTART_state;
  wire [1-1:0] M_edge_detector_left_out;
  reg [1-1:0] M_edge_detector_left_in;
  edge_detector_8 edge_detector_left (
    .clk(clk),
    .in(M_edge_detector_left_in),
    .out(M_edge_detector_left_out)
  );
  wire [1-1:0] M_edge_detector_right_out;
  reg [1-1:0] M_edge_detector_right_in;
  edge_detector_8 edge_detector_right (
    .clk(clk),
    .in(M_edge_detector_right_in),
    .out(M_edge_detector_right_out)
  );
  wire [1-1:0] M_button_cond_left_out;
  reg [1-1:0] M_button_cond_left_in;
  button_conditioner_10 button_cond_left (
    .clk(clk),
    .in(M_button_cond_left_in),
    .out(M_button_cond_left_out)
  );
  wire [1-1:0] M_button_cond_right_out;
  reg [1-1:0] M_button_cond_right_in;
  button_conditioner_10 button_cond_right (
    .clk(clk),
    .in(M_button_cond_right_in),
    .out(M_button_cond_right_out)
  );
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_12 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_playing_d = M_playing_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    M_button_cond_left_in = lb;
    M_button_cond_right_in = rb;
    M_edge_detector_left_in = M_button_cond_left_out;
    M_edge_detector_right_in = M_button_cond_right_out;
    M_mygs_rst = rst;
    M_mygo_rst = rst;
    M_mybrick_rst = rst;
    M_mybrick_ballpos = M_myball_ballpos;
    M_mybrick_secondballpos = M_myballtwo_ballpos;
    M_mybrick_playing = M_playing_q;
    M_mypc_lb = lb;
    M_mypc_rb = rb;
    M_mypc_rst = rst;
    M_myball_rst = rst;
    M_myball_paddlepos = M_mypc_out;
    M_myball_playing = M_playing_q;
    M_myballtwo_rst = rst;
    M_myballtwo_paddlepos = M_mypc_out;
    M_myballtwo_playing = M_playing_q;
    M_myws_playing = M_playing_q;
    M_myws_gameover = M_mygo_gameover;
    M_myws_gamestart = M_mygs_gamestart;
    M_myws_rst = rst;
    M_myws_ball = M_myball_ballpos;
    M_myws_secondball = M_myballtwo_ballpos;
    M_myws_paddle = M_mypc_out;
    M_myws_brick = M_mybrick_brickpos;
    dataOut = M_myws_datain;
    io_led[0+1+1-:2] = M_playing_q;
    io_led[0+0+0-:1] = M_myball_endgame;
    io_led[8+0+3-:4] = M_myball_ballposx;
    io_led[16+7-:8] = M_mybrick_endgame;
    
    case (M_state_q)
      GAMESTART_state: begin
        M_myws_playing = M_playing_q;
        M_myws_gamestart = M_mygs_gamestart;
        dataOut = M_myws_datain;
        M_playing_d = 2'h0;
        if (M_edge_detector_left_out == 1'h1) begin
          M_playing_d = 2'h1;
          M_state_d = PLAYING_state;
        end
        if (M_edge_detector_right_out == 1'h1) begin
          M_playing_d = 2'h2;
          M_state_d = PLAYTWO_state;
        end
      end
      PLAYING_state: begin
        M_playing_d = 2'h1;
        M_myws_playing = M_playing_q;
        M_myws_ball = M_myball_ballpos;
        M_myws_paddle = M_mypc_out;
        M_myws_brick = M_mybrick_brickpos;
        dataOut = M_myws_datain;
        if (M_myball_endgame == 1'h1 || M_mybrick_endgame == 1'h1) begin
          M_playing_d = 2'h3;
          M_state_d = GAMEOVER_state;
        end
      end
      PLAYTWO_state: begin
        M_playing_d = 2'h2;
        M_myws_playing = M_playing_q;
        M_myws_ball = M_myball_ballpos;
        M_myws_secondball = M_myballtwo_ballpos;
        M_myws_paddle = M_mypc_out;
        M_myws_brick = M_mybrick_brickpos;
        dataOut = M_myws_datain;
        if (M_myballtwo_endgame == 1'h1 || M_myball_endgame == 1'h1 || M_mybrick_endgame == 1'h1) begin
          M_playing_d = 2'h3;
          M_state_d = GAMEOVER_state;
        end
      end
      GAMEOVER_state: begin
        M_playing_d = 2'h3;
        M_myws_playing = M_playing_q;
        M_myws_gameover = M_mygo_gameover;
        dataOut = M_myws_datain;
        if (M_edge_detector_left_out == 1'h1 || M_edge_detector_right_out == 1'h1) begin
          M_myws_playing = M_playing_q;
          M_myws_gamestart = M_mygs_gamestart;
          dataOut = M_myws_datain;
          M_playing_d = 2'h0;
          M_state_d = GAMESTART_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_playing_q <= M_playing_d;
    M_state_q <= M_state_d;
  end
  
endmodule
