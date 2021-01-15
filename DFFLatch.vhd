-- Jared Day
-- 10/2/17


-- This is a 6465 Dual D Flip-Flop Latch. Has enable only (no clock).

LIBRARY ieee;											-- including libraries
USE ieee.std_logic_1164.ALL;

ENTITY DFFLatch IS
PORT(
		i_en1, i_en2		: IN std_logic;											-- clk input
		i_D		: IN std_logic_vector(3 DOWNTO 0);					-- two different D's
		o_Q1		: OUT std_logic_vector(1 DOWNTO 0);					-- Q1 and Q1bar
		o_Q2		: OUT std_logic_vector(1 DOWNTO 0);				   -- Q2 and Q2bar
		o_Q3		: OUT std_logic_vector(1 DOWNTO 0);					-- Q3 and Q3bar
		o_Q4		: OUT std_logic_vector(1 DOWNTO 0));				-- Q4 and Q4bar
		
END DFFLatch;

ARCHITECTURE arch OF DFFLatch IS
BEGIN
	PROCESS (i_en1, i_en2, i_D)														-- sensitivity list
	BEGIN 
		IF(i_en1 = '0' AND i_en2 = '0') THEN							-- if enable is low do nothing
		
		ELSIF	(i_en1 = '1' AND i_en2 = '0') THEN						-- else map to Q and Qbar
			o_Q4(1) <= i_D(3);
			o_Q4(0) <= not(i_D(3));
																					-- for both FF's
			o_Q3(1) <= i_D(2);
			o_Q3(0) <= not(i_D(2));
		ELSIF (i_en1 = '0' AND i_en2 = '1') THEN	
			o_Q2(1) <= i_D(1);
			o_Q2(0) <= not(i_D(1));
																					-- for both FF's
			o_Q1(1) <= i_D(0);
			o_Q1(0) <= not(i_D(0));
		ELSE
			o_Q4(1) <= i_D(3);
			o_Q4(0) <= not(i_D(3));
																					-- for both FF's
			o_Q3(1) <= i_D(2);
			o_Q3(0) <= not(i_D(2));
		
		
			o_Q2(1) <= i_D(1);
			o_Q2(0) <= not(i_D(1));
																					-- for both FF's
			o_Q1(1) <= i_D(0);
			o_Q1(0) <= not(i_D(0));
		END IF;
	END PROCESS;
END arch;