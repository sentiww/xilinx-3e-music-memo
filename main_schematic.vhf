--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : main_schematic.vhf
-- /___/   /\     Timestamp : 04/24/2024 21:34:39
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/wojci/xilinx-3e-music-memo/xilinx-3e-music-memo/main_schematic.vhf -w C:/Users/wojci/xilinx-3e-music-memo/xilinx-3e-music-memo/main_schematic.sch
--Design Name: main_schematic
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity main_schematic is
   port ( Clk_50MHz   : in    std_logic; 
          PS2_Clk     : in    std_logic; 
          PS2_Data    : in    std_logic; 
          RESET       : in    std_logic; 
          RS232_RxD   : in    std_logic; 
          SPI_MISO    : in    std_logic; 
          AD_CONV     : out   std_logic; 
          AMP_CS      : out   std_logic; 
          Busy        : out   std_logic; 
          DAC_CLR     : out   std_logic; 
          DAC_CS      : out   std_logic; 
          FPGA_INIT_B : out   std_logic; 
          RS232_TxD   : out   std_logic; 
          SF_CE0      : out   std_logic; 
          SPI_MOSI    : out   std_logic; 
          SPI_SCK     : out   std_logic; 
          SPI_SS_B    : out   std_logic; 
          TxBusyLed   : out   std_logic);
end main_schematic;

architecture BEHAVIORAL of main_schematic is
   signal XLXN_1      : std_logic;
   signal XLXN_3      : std_logic_vector (11 downto 0);
   signal XLXN_4      : std_logic_vector (3 downto 0);
   signal XLXN_5      : std_logic_vector (3 downto 0);
   signal XLXN_32     : std_logic_vector (7 downto 0);
   signal XLXN_33     : std_logic;
   signal XLXN_65     : std_logic;
   signal XLXN_66     : std_logic_vector (7 downto 0);
   signal XLXN_69     : std_logic_vector (15 downto 0);
   component DACWrite
      port ( Reset       : in    std_logic; 
             Start       : in    std_logic; 
             SPI_MISO    : in    std_logic; 
             Cmd         : in    std_logic_vector (3 downto 0); 
             Addr        : in    std_logic_vector (3 downto 0); 
             DATA        : in    std_logic_vector (11 downto 0); 
             DAC_CLR     : out   std_logic; 
             DAC_CS      : out   std_logic; 
             SPI_MOSI    : out   std_logic; 
             SPI_SCK     : out   std_logic; 
             SPI_SS_B    : out   std_logic; 
             AMP_CS      : out   std_logic; 
             AD_CONV     : out   std_logic; 
             SF_CE0      : out   std_logic; 
             FPGA_INIT_B : out   std_logic; 
             Busy        : out   std_logic; 
             Clk_50MHz   : in    std_logic; 
             Clk_Sys     : in    std_logic);
   end component;
   
   component frequency_generator
      port ( clk               : in    std_logic; 
             reset             : in    std_logic; 
             frequencyModCount : in    std_logic_vector (15 downto 0); 
             start             : out   std_logic; 
             saw               : out   std_logic_vector (11 downto 0));
   end component;
   
   component RS232
      port ( Clk_50MHz : in    std_logic; 
             Reset     : in    std_logic; 
             RS232_RxD : in    std_logic; 
             TxStart   : in    std_logic; 
             TxDI      : in    std_logic_vector (7 downto 0); 
             TxBusy    : out   std_logic; 
             RxRdy     : out   std_logic; 
             RS232_TxD : out   std_logic; 
             RxDO      : out   std_logic_vector (7 downto 0); 
             Clk_Sys   : in    std_logic);
   end component;
   
   component PS2_Rx
      port ( PS2_Clk   : in    std_logic; 
             PS2_Data  : in    std_logic; 
             Clk_50MHz : in    std_logic; 
             Clk_Sys   : in    std_logic; 
             DO_Rdy    : out   std_logic; 
             DO        : out   std_logic_vector (7 downto 0));
   end component;
   
   component rs232_keyboard_to_frequency
      port ( rxRdy             : in    std_logic; 
             ascii             : in    std_logic_vector (7 downto 0); 
             frequencyModCount : out   std_logic_vector (15 downto 0));
   end component;
   
begin
   XLXN_4(3 downto 0) <= x"3";
   XLXN_5(3 downto 0) <= x"F";
   XLXI_1 : DACWrite
      port map (Addr(3 downto 0)=>XLXN_5(3 downto 0),
                Clk_Sys=>Clk_50MHz,
                Clk_50MHz=>Clk_50MHz,
                Cmd(3 downto 0)=>XLXN_4(3 downto 0),
                DATA(11 downto 0)=>XLXN_3(11 downto 0),
                Reset=>RESET,
                SPI_MISO=>SPI_MISO,
                Start=>XLXN_1,
                AD_CONV=>AD_CONV,
                AMP_CS=>AMP_CS,
                Busy=>Busy,
                DAC_CLR=>DAC_CLR,
                DAC_CS=>DAC_CS,
                FPGA_INIT_B=>FPGA_INIT_B,
                SF_CE0=>SF_CE0,
                SPI_MOSI=>SPI_MOSI,
                SPI_SCK=>SPI_SCK,
                SPI_SS_B=>SPI_SS_B);
   
   XLXI_7 : frequency_generator
      port map (clk=>Clk_50MHz,
                frequencyModCount(15 downto 0)=>XLXN_69(15 downto 0),
                reset=>RESET,
                saw(11 downto 0)=>XLXN_3(11 downto 0),
                start=>XLXN_1);
   
   XLXI_10 : RS232
      port map (Clk_Sys=>Clk_50MHz,
                Clk_50MHz=>Clk_50MHz,
                Reset=>RESET,
                RS232_RxD=>RS232_RxD,
                TxDI(7 downto 0)=>XLXN_32(7 downto 0),
                TxStart=>XLXN_33,
                RS232_TxD=>RS232_TxD,
                RxDO(7 downto 0)=>XLXN_66(7 downto 0),
                RxRdy=>XLXN_65,
                TxBusy=>TxBusyLed);
   
   XLXI_11 : PS2_Rx
      port map (Clk_Sys=>Clk_50MHz,
                Clk_50MHz=>Clk_50MHz,
                PS2_Clk=>PS2_Clk,
                PS2_Data=>PS2_Data,
                DO(7 downto 0)=>XLXN_32(7 downto 0),
                DO_Rdy=>XLXN_33);
   
   XLXI_19 : rs232_keyboard_to_frequency
      port map (ascii(7 downto 0)=>XLXN_66(7 downto 0),
                rxRdy=>XLXN_65,
                frequencyModCount(15 downto 0)=>XLXN_69(15 downto 0));
   
end BEHAVIORAL;


