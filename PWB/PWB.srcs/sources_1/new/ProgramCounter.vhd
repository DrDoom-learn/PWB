----------------------------------------------------------------------------------
-- Company: DTU - Design of digital systems 
-- Engineer: Grup
-- 
-- Create Date: 17.03.2022 11:16:51
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
-- Project Name: PWB
-- Target Devices: NEXUS DDR 4
-- Tool Versions: 
-- Description: Program counter, increments, holds, branches or jumps counter
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ProgramCounter is
 Port ( 
RESET: in std_logic;
CLK: in std_logic;
Address_In: in std_logic_vector (7 downto 0);
PS: in std_logic_vector (1 downto 0);
Offset: in std_logic_vector (7 downto 0);
PC: out std_logic_vector (7 downto 0)
 );
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin

Programcounter: process(reset,clk)               -- Program counter register 
variable PC_sig: std_logic_vector (7 downto 0);

begin 
	if RESET ='1' then							-- Asynchrounes reset
		PC_sig :=x"00";
	elsif clk'event and clk='1' then
		if PS = "00" then                 -- Hold PC
	          PC_sig := PC_sig;
		elsif PS = "01" then              -- Increment PC +1
		      PC_sig := PC_sig + x"01";	
		elsif PS = "10" then              -- Offset PC
		      PC_sig := PC_sig + Offset;
		elsif PS = "11" then              -- Jump to Address_In
		      PC_sig := Address_In;
	    end if;
	end if;
	
	PC <= PC_sig;

end process;




end Behavioral;
