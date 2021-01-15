-- Jared Day
-- 9/25/17

-- two input multiplexer lab 5 pt a

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY twoinputmux IS
PORT( 
		i_A		: IN std_logic;
		i_B		: IN std_logic;
		i_select	: IN std_logic;
		o_OUT		: OUT std_logic);
END twoinputmux;

ARCHITECTURE ckt OF twoinputmux IS
BEGIN
	PROCESS(i_select, i_A, i_B)
		BEGIN
			IF (i_select = '0') THEN
				o_OUT <= i_A;
				ELSIF (i_select = '1') THEN
				o_OUT <= i_B;
			END IF;
	END PROCESS;
END ckt;
	