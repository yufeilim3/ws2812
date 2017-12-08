<?xml version="1.0" encoding="UTF-8"?>
<project name="ws2812" board="Mojo V3" language="Lucid">
  <files>
    <src>brickgen.luc</src>
    <src>adder16bit.luc</src>
    <src>multiplier.luc</src>
    <src>cmp.luc</src>
    <src>gamestart.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>ws2812b.luc</src>
    <src>alu16bit.luc</src>
    <src>gameover.luc</src>
    <src>shifter.luc</src>
    <src>ballcontrol.luc</src>
    <src>adder.luc</src>
    <src>boole.luc</src>
    <src>playercontrol.luc</src>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf>custom.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <component>pwm.luc</component>
    <component>reset_conditioner.luc</component>
    <component>pipeline.luc</component>
    <component>button_conditioner.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
