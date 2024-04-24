----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:58:06 04/24/2024 
-- Design Name: 
-- Module Name:    rs232_to_frequency - Behavioral 
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

entity rs232_keyboard_to_frequency is
    Port ( ascii : in  STD_LOGIC_VECTOR (7 downto 0);
			  rxRdy : in STD_LOGIC;
			  frequencyModCount : out STD_LOGIC_VECTOR (15 downto 0));
end rs232_keyboard_to_frequency;

architecture Behavioral of rs232_keyboard_to_frequency is

begin

	process(rxRdy) 
	begin
	
		if (rxRdy = '1') then
		
			case ascii is
				when "01100001" => frequencyModCount <= std_logic_vector(to_unsigned(5972, 16)); -- C
				when "01110111" => frequencyModCount <= std_logic_vector(to_unsigned(5637, 16)); -- C#
				when "01110011" => frequencyModCount <= std_logic_vector(to_unsigned(5322, 16)); -- D
				when "01100101" => frequencyModCount <= std_logic_vector(to_unsigned(5022, 16)); -- D#
				when "01100100" => frequencyModCount <= std_logic_vector(to_unsigned(4740, 16)); -- E
				when "01100110" => frequencyModCount <= std_logic_vector(to_unsigned(4474, 16)); -- F
				when "01110100" => frequencyModCount <= std_logic_vector(to_unsigned(4223, 16)); -- F#
				when "01100111" => frequencyModCount <= std_logic_vector(to_unsigned(3986, 16)); -- G
				when "01111001" => frequencyModCount <= std_logic_vector(to_unsigned(3762, 16)); -- G#
				when "01101000" => frequencyModCount <= std_logic_vector(to_unsigned(3551, 16)); -- A
				when "01110101" => frequencyModCount <= std_logic_vector(to_unsigned(3352, 16)); -- A#
				when "01101010" => frequencyModCount <= std_logic_vector(to_unsigned(3164, 16)); -- B
			
				when others => frequencyModCount <= std_logic_vector(to_unsigned(0, 16));
			end case;
			
		end if;
	
	end process;

end Behavioral;

