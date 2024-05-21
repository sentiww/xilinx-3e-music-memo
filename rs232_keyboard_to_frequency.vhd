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
    Port ( scan : in  STD_LOGIC_VECTOR (7 downto 0);
			  rxRdy : in STD_LOGIC;
			  f0 : in STD_LOGIC;
			  clk : in STD_LOGIC;
			  frequencyModCount : out STD_LOGIC_VECTOR (15 downto 0));
end rs232_keyboard_to_frequency;

architecture Behavioral of rs232_keyboard_to_frequency is

	-- state machine 
	type stateType is ( StartState, PlayNoteState, InputNoteState, ValidationNoteState, InvalidNoteState, GameoverState, IncNoteState, SilenceState, IncInputNoteState, HarmonicaState );
	signal state, nextState : stateType;
	
	-- context
	type arrayOfNotes is array (0 to 4) of std_logic_vector(15 downto 0);
	signal notes : arrayOfNotes;
	
	-- TODO 
	-- type arrayOfNoteDurations is array (0 to 4) of integer;
	-- signal notes : arrayOfNotes;
	
	signal inputNote : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(0, 16));
	-- TODO
	-- signal inputNoteDuration : integer; 
	
	signal notesCount : integer := 5; 
	signal noteIndex : integer; 
	signal playedNoteIndex : integer; 
	signal inputNoteIndex : integer; 
	
	signal outputNote : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(0, 16));
	
	-- measure time 
	signal counter : natural := 0; 
	signal timeout : std_logic := '0';
	constant MAX_COUNT : natural := 150000000; -- number of cycles in 3 seconds in 50 MHz clokc
	
	-- 0 - memo game
	-- 1 - keyboard
	signal mode : std_logic := '0';

begin


	process ( clk )
	begin
		if rising_edge( clk ) then
			state <= nextState;
		end if;
	end process;
	
	
	process ( clk, state )
	begin
		if rising_edge(clk) and timeout = '1' then 
			nextState <= state;

			case state is
				when HarmonicaState => 
					nextState <= StartState;
			
				when StartState => 
					nextState <= PlayNoteState;
					
				when PlayNoteState => 
					if noteIndex < playedNoteIndex then 
						nextState <= PlayNoteState;
					else
						nextState <= IncNoteState;
					end if;
					
				when IncNoteState => 
					nextState <= InputNoteState;
				
				when InputNoteState => 
					if inputNoteIndex < playedNoteIndex then
						nextState <= ValidationNoteState;
					elsif inputNoteIndex = notesCount - 1 then
						nextState <= GameoverState;
					else
						nextState <= PlayNoteState;
					end if;
				
				when ValidationNoteState => 
					if to_integer(unsigned(inputNote)) = to_integer(unsigned(notes(inputNoteIndex))) then -- TODO add && condition duration +- 25% 
						nextState <= IncInputNoteState;
					else
						nextState <= InvalidNoteState;
					end if;
					
				when IncInputNoteState => 
					nextState <= InputNoteState;
					
				when InvalidNoteState => 
					nextState <= SilenceState;
					
				when SilenceState =>
					nextState <= PlayNoteState;
					
				when GameoverState => 
					nextState <= StartState;
			end case;

		end if;
	end process;
	
	
	process(clk) -- StartState
	begin 
		if rising_edge(clk) and timeout = '1' then 
			notes(0) <= std_logic_vector(to_unsigned(5972, 16));
			notes(1) <= std_logic_vector(to_unsigned(5022, 16));
			notes(2) <= std_logic_vector(to_unsigned(5972, 16));
			notes(3) <= std_logic_vector(to_unsigned(5022, 16));
			notes(4) <= std_logic_vector(to_unsigned(5972, 16));
		end if; 
	end process;
	
	
	process(clk) -- PlayNoteState
	begin 
		if rising_edge(clk) and timeout = '1' then
			if state = InvalidNoteState or state = GameoverState or state = InputNoteState or state = StartState then --reset
				noteIndex <= 0;
			elsif state = PlayNoteState then
				noteIndex <= noteIndex + 1;
			end if;
		end if; 
	end process;
	
	
	process(clk) -- IncNoteState
	begin 
		if rising_edge(clk) and timeout = '1'  then
			if state = InvalidNoteState or state = GameoverState or state = StartState then --reset
				playedNoteIndex <= 0;
			elsif state = IncNoteState then 
				playedNoteIndex <= playedNoteIndex + 1;
			end if;
		end if; 
	end process;
	

	process(clk) -- InputNoteState
	begin 
		if rising_edge(clk) and timeout = '1' then
			if state = InvalidNoteState or state = GameoverState or state = PlayNoteState or state = StartState then --reset
				inputNoteIndex <= 0;
			elsif state = IncInputNoteState then
				inputNoteIndex <= inputNoteIndex + 1; 
			end if;
		end if; 
	end process;


	process(clk) -- counter to measure time
	begin 
		if rising_edge(clk) then 
			if counter < MAX_COUNT then
				counter <= counter + 1;
				timeout <= '0';
			else 
				counter <= 0;
				timeout <= '1';
			end if;
		end if;
	end process;
	

	
	process(clk, rxRdy, f0) -- Input from keyboard 
	begin
		if (rising_edge(clk)) then
	
			if ( rxRdy = '1' and state = HarmonicaState ) then -- f0 if key is pressed 
			
				if ( f0 = '0' ) then
					case scan is
						when "00011100" => outputNote <= std_logic_vector(to_unsigned(5972, 16)); -- C
						when "00011101" => outputNote <= std_logic_vector(to_unsigned(5637, 16)); -- C#
						when "00011011" => outputNote <= std_logic_vector(to_unsigned(5322, 16)); -- D
						when "00100100" => outputNote <= std_logic_vector(to_unsigned(5022, 16)); -- D#
						when "00100011" => outputNote <= std_logic_vector(to_unsigned(4740, 16)); -- E
						when "00101011" => outputNote <= std_logic_vector(to_unsigned(4474, 16)); -- F
						when "00101100" => outputNote <= std_logic_vector(to_unsigned(4223, 16)); -- F#
						when "00110100" => outputNote <= std_logic_vector(to_unsigned(3986, 16)); -- G
						when "00110101" => outputNote <= std_logic_vector(to_unsigned(3762, 16)); -- G#
						when "00110011" => outputNote <= std_logic_vector(to_unsigned(3551, 16)); -- A
						when "00111100" => outputNote <= std_logic_vector(to_unsigned(3352, 16)); -- A#
						when "00111011" => outputNote <= std_logic_vector(to_unsigned(3164, 16)); -- B
					
						when others => outputNote <= std_logic_vector(to_unsigned(0, 16));
					end case;
				else
					outputNote <= std_logic_vector(to_unsigned(0, 16));
				end if;
			end if;
		end if;
	end process;
	
	
	process(clk, rxRdy, f0) -- Input from keyboard 
	begin
		if (rising_edge(clk)) then
			if ( f0 = '0' and rxRdy = '1' and state = InputNoteState) then -- f0 if key is pressed 
				case scan is
					when "00011100" => inputNote <= std_logic_vector(to_unsigned(5972, 16)); -- C
					when "00011101" => inputNote <= std_logic_vector(to_unsigned(5637, 16)); -- C#
					when "00011011" => inputNote <= std_logic_vector(to_unsigned(5322, 16)); -- D
					when "00100100" => inputNote <= std_logic_vector(to_unsigned(5022, 16)); -- D#
					when "00100011" => inputNote <= std_logic_vector(to_unsigned(4740, 16)); -- E
					when "00101011" => inputNote <= std_logic_vector(to_unsigned(4474, 16)); -- F
					when "00101100" => inputNote <= std_logic_vector(to_unsigned(4223, 16)); -- F#
					when "00110100" => inputNote <= std_logic_vector(to_unsigned(3986, 16)); -- G
					when "00110101" => inputNote <= std_logic_vector(to_unsigned(3762, 16)); -- G#
					when "00110011" => inputNote <= std_logic_vector(to_unsigned(3551, 16)); -- A
					when "00111100" => inputNote <= std_logic_vector(to_unsigned(3352, 16)); -- A#
					when "00111011" => inputNote <= std_logic_vector(to_unsigned(3164, 16)); -- B
				
					when others => inputNote <= std_logic_vector(to_unsigned(0, 16));
				end case;
			elsif state = IncInputNoteState or state = PlayNoteState or state = GameoverState then
				inputNote <= std_logic_vector(to_unsigned(0, 16));
			end if;
		end if;
	end process;
	
	
	process(clk, rxRdy, f0) -- Input from keyboard 
	begin
		if (rising_edge(clk)) then
			if (f0 = '0' and rxRdy = '1') then -- f0 if key is pressed 
			
				case scan is
					when "00000101" => mode <= not mode;
					when others => mode <= mode;
				end case;
			end if;
		end if;
	end process;
	
	
	with state select frequencyModCount <= 
							std_logic_vector(to_unsigned(3986, 16)) when InvalidNoteState,   -- error sound
							std_logic_vector(to_unsigned(3164, 16)) when GameoverState,      -- gameover sound
							inputNote 										 when InputNoteState,     -- input sound 
							outputNote 										 when HarmonicaState,     -- harmonica sound 
							notes(noteIndex)	         	          when PlayNoteState,      -- from array sound
							std_logic_vector(to_unsigned(0, 16))    when others;		        -- silence when any other state

end Behavioral;

 