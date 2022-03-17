----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2022 11:01:44
-- Design Name: 
-- Module Name: MicroprogramController - Behavioral
-- Project Name: 
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

entity MicroprogramController is
  Port ( 
RESET: in std_logic;
CLK: in std_logic;
Address_In: in std_logic_vector ( 7 downto 0); Address_Out: out std_logic_vector ( 7 downto 0); 
Instruction_In: in std_logic_vector (15 downto 0); 
Constant_Out: out std_logic_vector ( 7 downto 0); 
V,C,N,Z: in std_logic;
DX,AX,BX,FS: out std_logic_vector( 3 downto 0); 
MB,MD,RW,MM,MW: out std_logic);
end MicroprogramController;

architecture Behavioral of MicroprogramController is

component ProgramCounter is
    Port(
    RESET <= RESET; 
    CLK <= CLK
    );


begin


end Behavioral;



