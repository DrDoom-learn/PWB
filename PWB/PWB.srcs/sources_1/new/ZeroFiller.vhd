----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2022 11:23:54
-- Design Name: 
-- Module Name: ZeroFiller - Behavioral
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

entity ZeroFiller is
 Port ( 
 IR: in std_logic_vector (15 downto 0); 
 ZeroFilled_8: out std_logic_vector ( 7 downto 0)
 );
end ZeroFiller;

architecture Behavioral of ZeroFiller is

begin


end Behavioral;
