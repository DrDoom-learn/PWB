-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Instruction_Decoder_tb is
end;

architecture bench of Instruction_Decoder_tb is

  component Instruction_Decoder
  port (
      RESET: in std_logic;
      CLK: in std_logic;
      IR: in std_logic_vector (15 downto 0);
      V,C,N,Z: in std_logic;
      PS: out std_logic_vector ( 1 downto 0);
      IL: out std_logic;
      DX,AX,BX,FS: out std_logic_vector ( 3 downto 0);
      MB,MD,RW,MM,MW: out std_logic);
  end component;

  signal RESET: std_logic;
  signal CLK: std_logic;
  signal IR: std_logic_vector (15 downto 0);
  signal V,C,N,Z: std_logic;
  signal PS: std_logic_vector ( 1 downto 0);
  signal IL: std_logic;
  signal DX,AX,BX,FS: std_logic_vector ( 3 downto 0);
  signal MB,MD,RW,MM,MW: std_logic;

  signal end_test: STD_LOGIC:='1';
  
  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;


begin
  uut: Instruction_Decoder port map ( RESET => RESET,
                                      CLK   => CLK,
                                      IR    => IR,
                                      V     => V,
                                      C     => C,
                                      N     => N,
                                      Z     => Z,
                                      PS    => PS,
                                      IL    => IL,
                                      DX    => DX,
                                      AX    => AX,
                                      BX    => BX,
                                      FS    => FS,
                                      MB    => MB,
                                      MD    => MD,
                                      RW    => RW,
                                      MM    => MM,
                                      MW    => MW );
                                      
clock: process
begin
    while end_test='1' loop
    clk <= '0';
    wait for clock_period*0.5;
    clk <= '1';
    wait for clock_period*0.5;
    end loop;
    wait;
end process;

  stimulus: process
  begin
  
    -- Put initialisation code here
      
      
      IR <= "0001101" & "000" & "000" & "000";
      V <= 'X';
      C <= 'X';
      N <= 'X';
      Z <= '0';
      
        wait for clock_period;

      IR <= "0001101" & "000" & "000" & "000";
      V <= 'X';
      C <= 'X';
      N <= 'X';
      Z <= '1';
      
        wait for clock_period;
      IR <= "0001101" & "000" & "000" & "000";
      V <= 'X';
      C <= 'X';
      N <= 'X';
      Z <= '0';
              
        wait for clock_period;
      IR <= "0001101" & "000" & "000" & "000";
      V <= 'X';
      C <= 'X';
      N <= 'X';
      Z <= '1';
      
        wait for clock_period;
      IR <= "0001101" & "000" & "000" & "000";
      V <= 'X';
      C <= 'X';
      N <= 'X';
      Z <= 'X';
      
        wait for clock_period;
      IR <= "0001101" & "000" & "000" & "000";
      V <= 'X';
      C <= 'X';
      N <= 'X';
      Z <= '0';
       
        wait for clock_period;
       IR <= "0001101" & "000" & "000" & "000";
      V <= 'X';
      C <= 'X';
      N <= 'X';
      Z <= '1';
             wait for clock_period;
       IR <= "0001101" & "000" & "000" & "000";
      V <= 'X';
      C <= 'X';
      N <= 'X';
      Z <= 'X';
              wait for clock_period;
       IR <= "0001101" & "000" & "000" & "000";
      V <= 'X';
      C <= 'X';
      N <= 'X';
      Z <= 'X';
              wait for clock_period;
       IR <= "0001101" & "000" & "000" & "000";
      V <= 'X';
      C <= 'X';
      N <= 'X';
      Z <= 'X';
              wait for clock_period;
    
    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;