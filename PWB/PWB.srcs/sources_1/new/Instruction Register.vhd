----------------------------------------------------------------------------------
-- Company: DTU- digital desing
-- Engineer: hold 1
-- 
-- Create Date: 10.03.2022 11:23:48
-- Design Name: 
-- Module Name: Instruction Register - Behavioral
-- Project Name: PWB
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity InstructionRegister is
port (
RESET: in std_logic;
CLK: in std_logic;
Instruction_In: in std_logic_vector (15 downto 0);
IL: in std_logic;
IR: out std_logic_vector (15 downto 0)
);
End InstructionRegister;
Architecture IR_Behavorial of InstructionRegister is

Begin

InstructionReg: process(reset,clk)                    --InstructionReg 
begin 
    if Reset ='1' then					    -- Asynchrounes reset
		IR <=x"0000";
	elsif clk'event and clk='1' then
		if IL = '1' then                 -- check for tilhørende load værdi
			IR <= Instruction_In;                    -- Instruction_In indsættes på IR     
	    end if;
	end if;
end process;

End;
