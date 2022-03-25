----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2022 19:04:01
-- Design Name: 
-- Module Name: InstructionDecoderController - Behavioral
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

entity InstructionDecoderController is
    Port ( 
    RESET: in std_logic;
    CLK: in std_logic;
    IR: in std_logic_vector (15 downto 0);
    V,C,N,Z: in std_logic;
    --PS: out std_logic_vector ( 1 downto 0);
    --IL: out std_logic;
    DX,AX,BX,FS: out std_logic_vector ( 3 downto 0);
    MB,MD,RW,MM,MW: out std_logic;
    
    ID: in std_logic;
    IL: out std_logic;
    PS: out std_logic_vector( 1 downto 0)
    
    );
end InstructionDecoderController;

architecture Behavioral of InstructionDecoderController is

TYPE STATE_TYPE IS (INF, EX0, EX1);
SIGNAL State, NextState   : STATE_TYPE;


begin
StateReg: process (RESET,CLK)
begin 
    if RESET = '1' then state <= INF;
    elsif CLK'event and CLK = '1' then
    State <= NextState;
    end if;
end process;


StateDec: process (CLK, RESET)
begin
      if (clk'EVENT AND clk = '1') THEN
         CASE state is
            when INF=>
                  IL <= '1';
                  PS <= "00";
                  NextState <= EX0;
                  
            WHEN EX0=>
               if ID = '0' then
                  IL <= '0';
                  PS <= "01";
                  NextState <= INF;
                  
               elsif ID = '1' then
                  IL <= '0';
                  PS <= "00";
                  NextState <= EX1;
               end if;
               
            WHEN EX1=>
               if ID = 'X' THEN
                  IL <= '0';
                  PS <= "01";
                  NextState <= INF;
               end if;
         end case;
      end if;
   end process;  

end Behavioral;
