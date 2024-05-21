----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:32:36 04/23/2024 
-- Design Name: 
-- Module Name:    frequency-generator - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frequency_generator is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  start : out STD_LOGIC;
           saw : out  STD_LOGIC_VECTOR (11 downto 0));
end frequency_generator;

architecture Behavioral of frequency_generator is

begin

	signal count : integer := 0;
	signal modCount : integer := 0;
	signal startInternal : boolean := false;
	signal updateStart : std_logic := '0';

	begin 
	
	counter_process: process(clk) begin
		if rising_edge(clk) then
			if modCount = 3124 then
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

	saw <= STD_LOGIC_VECTOR( to_unsigned( count * 256, 12 ) );
	start <= updateStart;

end Behavioral;

