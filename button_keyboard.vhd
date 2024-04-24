----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:03:42 04/24/2024 
-- Design Name: 
-- Module Name:    button_keyboard - Behavioral 
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

entity button_keyboard is
    Port ( clk : in STD_LOGIC;
			  btn0 : in  STD_LOGIC;
           btn1 : in  STD_LOGIC;
           btn2 : in  STD_LOGIC;
           btn3 : in  STD_LOGIC;
           frequency : out  STD_LOGIC_VECTOR (15 downto 0));
end button_keyboard;

architecture Behavioral of button_keyboard is

begin

	process(clk) 
		variable value : std_logic_vector (3 downto 0);
	begin
		if (rising_edge(clk)) then
			value := btn3 & btn2 & btn1 & btn0;

			case value is
				when "0000" => frequency <= std_logic_vector(to_unsigned(0, 16));
				when "0001" => frequency <= std_logic_vector(to_unsigned(5972, 16)); -- C
				when "0010" => frequency <= std_logic_vector(to_unsigned(5637, 16)); -- C#
				when "0011" => frequency <= std_logic_vector(to_unsigned(5322, 16)); -- D
				when "0100" => frequency <= std_logic_vector(to_unsigned(5022, 16)); -- D#
				when "0101" => frequency <= std_logic_vector(to_unsigned(4740, 16)); -- E
				when "0110" => frequency <= std_logic_vector(to_unsigned(4474, 16)); -- F
				when "0111" => frequency <= std_logic_vector(to_unsigned(4223, 16)); -- F#
				when "1000" => frequency <= std_logic_vector(to_unsigned(3986, 16)); -- G
				when "1001" => frequency <= std_logic_vector(to_unsigned(3762, 16)); -- G#
				when "1010" => frequency <= std_logic_vector(to_unsigned(3551, 16)); -- A
				when "1011" => frequency <= std_logic_vector(to_unsigned(3352, 16)); -- A#
				when "1100" => frequency <= std_logic_vector(to_unsigned(3164, 16)); -- B
			
				when others => frequency <= std_logic_vector(to_unsigned(0, 16));
			end case;
		end if;
	end process;

end Behavioral;

