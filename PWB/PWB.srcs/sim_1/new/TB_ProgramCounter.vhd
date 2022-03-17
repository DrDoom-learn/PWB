library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ProgramCounter_tb is
end;

architecture bench of ProgramCounter_tb is

  component ProgramCounter
   Port ( 
  RESET: in std_logic;
  CLK: in std_logic;
  Address_In: in std_logic_vector (7 downto 0);
  PS: in std_logic_vector (1 downto 0);
  Offset: in std_logic_vector (7 downto 0);
  PC: out std_logic_vector (7 downto 0)
   );
  end component;

  signal RESET: std_logic;
  signal CLK: std_logic;
  signal Address_In: std_logic_vector (7 downto 0);
  signal PS: std_logic_vector (1 downto 0);
  signal Offset: std_logic_vector (7 downto 0);
  signal PC: std_logic_vector (7 downto 0) ;

-- Clock period definitions
   constant Clk_period : time := 1 ns;

begin

  uut: ProgramCounter port map ( RESET      => RESET,
                                 CLK        => CLK,
                                 Address_In => Address_In,
                                 PS         => PS,
                                 Offset     => Offset,
                                 PC         => PC );

-- Clock process definitions
   Clk_process: process
   begin
        clk <= '0';
        wait for Clk_period/2;
        clk <= '1';
        wait for Clk_period/2;
   end process;


  stimulus: process
  
  
  
  begin

    -- Initialisation code
    RESET <= '1';
    wait for Clk_period;
    RESET <= '0';
    Address_In <= x"04";
    PS <= "00";
    Offset <= x"02";

    
    wait for Clk_period;
    
    PS <= "01"; -- Increment PC
    wait for Clk_period;
    
    PS <= "10"; -- Branch to PC + Offset
    wait for Clk_period;
    
    PS <= "11"; -- Jump to Address_In
    wait for Clk_period;
    
    RESET <= '1';
    wait for Clk_period;
    RESET <= '0';
    PS <= "01";
    wait for Clk_period*4;
    
    
    end process;


end;