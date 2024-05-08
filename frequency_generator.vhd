----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:33:34 04/23/2024 
-- Design Name: 
-- Module Name:    frequency_generator - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frequency_generator is
    Port ( clk : in  std_logic;
           reset : in  std_logic;
			  frequencyModCount : in std_logic_vector (15 downto 0);
			  start : out std_logic;
           saw : out  std_logic_vector (11 downto 0));
end frequency_generator;

architecture Behavioral of frequency_generator is

	signal count : integer := 0;
	signal modCount : integer := 0;
	signal startInternal : boolean := false;
	signal updateStart : std_logic := '0';

	begin 
	
	counter_process: process(clk) begin
		if rising_edge(clk) then
			if modCount >= to_integer(unsigned(frequencyModCount)) then
					modCount <= 0;
					startInternal <= true;
					updateStart <= '1';
			else
				modCount <= modCount + 1;
				startInternal <= false;
				updateStart <= '0';
			end if;
		end if;
	end process counter_process;
	
	process(clk) begin
		if rising_edge(clk) then
			if startInternal = true then 
				if count = 15 then
						count <= 0;
					else 
						count <= count + 1;
				end if;
			end if;
		end if;
	end process;

	saw <= std_logic_vector(to_unsigned(count * 256, 12));
	start <= updateStart;
	
end Behavioral;

