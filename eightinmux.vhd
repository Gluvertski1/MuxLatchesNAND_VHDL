-- Jared Day
-- 9/25/17

-- Eight Input Multiplexer lab5 pt b

-- This 8 input multiplexer has an active low enable line. If enable = 1 then the output = 0.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;							-- declaring libraries

ENTITY eightinmux IS								
PORT( 		
		i_A		: IN std_logic_vector(7 DOWNTO 0);			-- 8 bit input using vector
		i_EN		: IN std_logic;									-- enable line
		i_SEL		: IN std_logic_vector(2 DOWNTO 0);			-- bit select line
		o_OUT		: OUT std_logic);									-- output
					
END eightinmux;

ARCHITECTURE ckt OF eightinmux IS
BEGIN
	PROCESS(i_A, i_EN, i_SEL)										-- nested if statement
		BEGIN																-- if enable is high then output is always zero
			   IF (i_EN = '1') THEN				
			   o_OUT <= '0';
				ELSIF (i_SEL = "000") THEN
				o_OUT <= i_A(0);
				ELSIF (i_SEL = "001") THEN
				o_OUT <= i_A(1);
				ELSIF (i_SEL = "010") THEN
				o_OUT <= i_A(2);
				ELSIF (i_SEL = "011") THEN
				o_OUT <= i_A(3);
				ELSIF (i_SEL = "100") THEN
				o_OUT <= i_A(4);
				ELSIF (i_SEL = "101") THEN
				o_OUT <= i_A(5);
				ELSIF (i_SEL = "110") THEN
				o_OUT <= i_A(6);
				ELSIF (i_SEL = "111") THEN
				o_OUT <= i_A(7);
				ELSE
				o_OUT <= '0';											-- else if there is a weird state hang up then output 
				END IF;													-- a zero.
	END PROCESS;
END ckt;
				