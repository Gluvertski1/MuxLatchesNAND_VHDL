-- Jared Day
-- 10/2/17

-- This program will create the 74244 Octal Tristate Buffer.
-- Has 2 enables.


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;						

ENTITY tristatebuffer IS
PORT( 
		i_A		:IN std_logic_vector(7 DOWNTO 0);					-- input 8 bits
		i_oe1		:IN std_logic;												-- enable for upper nibble
		i_oe2		:IN std_logic;												-- enable for lower nibble
		o_OUT		:OUT std_logic_vector(7 DOWNTO 0));					-- eight bit output
END tristatebuffer;

ARCHITECTURE ckt OF tristatebuffer IS
BEGIN
	PROCESS(i_A, i_oe1, i_oe2)												-- sensitivity list 
		BEGIN
			
			IF(i_oe1 = '1' AND i_oe2 = '1') THEN
				o_OUT <= i_A;													-- if both enable = 1 output all
			ELSIF(i_oe1 = '1' AND i_oe2 = '0') THEN
				o_OUT(7 DOWNTO 4) <= i_A(7 DOWNTO 4);					-- if nibble 1 enabled then allow high nibble through
				o_OUT(3 DOWNTO 0) <= "ZZZZ";								-- high Z the lower nibble
			ELSIF(i_oe1 = '0' AND i_oe2 = '1') THEN					-- if nibble 2 enabled then allow lower nibble through
				o_OUT(7 DOWNTO 4) <= "ZZZZ";								-- high Z the high nibble
				o_OUT(3 DOWNTO 0) <= i_A(3 DOWNTO 0);
			ELSE
				o_OUT <= "ZZZZZZZZ";											-- otherwise high Z everything.
			END IF;			
		END PROCESS;
END ckt;
			