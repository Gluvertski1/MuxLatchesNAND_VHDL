-- Jared Day
-- 10/5/17

-- This program will create a NAND Latch (using Boolean Equations), implementing the 
-- BUFFER keyword on output so it can feed the output pin back into the input.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NANDLatch IS
PORT(
		i_S	:IN std_logic;
		i_R	:IN std_logic;
		o_Q	:BUFFER std_logic_vector(1 DOWNTO 0));				-- use BUFFER keyword to allow 
END NANDLatch;																-- output of one to input of another

ARCHITECTURE ckt OF NANDLatch IS
	BEGIN
		PROCESS(i_S, i_R)
			BEGIN	
				o_Q(1) <= NOT(i_S AND o_Q(0));						-- using boolean equations.
				o_Q(0) <= NOT(i_R AND o_Q(1));
		END PROCESS;
END ckt;