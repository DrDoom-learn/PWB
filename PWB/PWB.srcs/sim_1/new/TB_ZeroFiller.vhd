----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2022 10:35:08
-- Design Name: 
-- Module Name: TB_ZeroFiller - Behavioral
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
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ZeroFiller_tb is
end;

architecture bench of ZeroFiller_tb is

  component ZeroFiller
   Port ( 
      IR: in std_logic_vector (15 downto 0); 
      ZeroFilled_8: out std_logic_vector ( 7 downto 0)
      );
  end component;

  signal IR: std_logic_vector (15 downto 0);
  signal ZeroFilled_8: std_logic_vector ( 7 downto 0) ;

begin

  uut: ZeroFiller port map ( IR           => IR,
                             ZeroFilled_8 => ZeroFilled_8 );

  stimulus: process
  begin
  
  IR <= "0000110111000101";
wait for 10 ns;
  IR <= "1111111111111111";
wait for 10 ns;
    wait;
  end process;


end;
