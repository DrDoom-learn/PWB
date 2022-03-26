----------------------------------------------------------------------------------
-- Company: DTU - Digital Design
-- Engineer: Hold  
-- 
-- Create Date: 10.03.2022 11:13:42
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
-- Project Name: PWB 
-- Target Devices: NEXUS DDR4 
-- Tool Versions: 
-- Description: Decodes instructions
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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity Instruction_Decoder is
port (
    RESET: in std_logic;
    CLK: in std_logic;
    IR:         in std_logic_vector (15 downto 0);
    V,C,N,Z:     in std_logic;
    PS:          out std_logic_vector ( 1 downto 0);
    IL:          out std_logic;
    DX,AX,BX,FS: out std_logic_vector ( 3 downto 0);
    MB,MD,RW,MM,MW: out std_logic);
end Instruction_Decoder;
 
 
 
 
architecture IDC_Behavioral of Instruction_Decoder is
  
    TYPE STATE_TYPE IS ( EX0 , EX1 , EX2 , EX3 , EX4 , EX5 , inf);
    SIGNAL state , ns : STATE_TYPE;

begin
    state_reg:process(CLK , RESET) is
        begin 
            if  RESET = '1'  then -- reset
            state <= inf; -- Go to inf state when reset = 1
                elsif rising_edge(clk) then
            state <= ns; -- else go to next state
        end if;
    end process;

state_dec:process(state)
    begin
        MB<='0';
        MD<='0';
        MW<='0';
        MM<='0';
        MW<='0';        
        ps<="00";
        DX<="0000";
        AX<="0000";
        BX<="0000";
        FS<="0000";

        --reset output
        
        case state is
            when inf => 
                IL<='1'; PS<="00"; DX<=('X' & IR(8 downto 6)); AX<=('X' & IR(5 downto 3)); BX<=('X' & IR(2 downto 0)); MB<='X'; FS<="0000"; MD<='X'; RW<='0'; MM<='1'; MW<='0';  -- 0
            ns <= EX0;
        
          --- **EX0** ---
        when EX0 =>    --- EX0 -> INF
            if IR(15 downto 9)="0000000"  then 
                IL<='0'; 
                PS<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; FS<="0000"; MD<='0'; 
                RW<='1'; MM<='X'; 
                MW<='0'; 
                ns <= inf;  -- 1 MOVA
                
            elsif IR(15 downto 9)="0000001"  then -- 2 INC
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; 
                FS<="0001"; 
                MD<='0'; 
                RW<='1'; 
                MM<='X'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="0000010"  then -- 3 ADD
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('0' & IR(2 downto 0)); 
                MB<='0'; 
                FS<="0010"; 
                MD<='0'; 
                RW<='1'; 
                MM<='X'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="0000101"  then -- 4 SUB
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('0' & IR(2 downto 0)); 
                MB<='0'; 
                FS<="0101"; 
                MD<='0'; 
                RW<='1'; 
                MM<='X'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="0000110"  then -- 5 DEC
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; 
                FS<="0110"; 
                MD<='0'; 
                RW<='1'; 
                MM<='X'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="0001000"  then -- 6 OR
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('0' & IR(2 downto 0)); 
                MB<='0'; 
                FS<="1000"; 
                MD<='0'; 
                RW<='1'; 
                MM<='X'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="0001001"  then -- 7 AND
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('0' & IR(2 downto 0)); 
                MB<='0'; 
                FS<="1001"; 
                MD<='0'; 
                RW<='1'; 
                MM<='X'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="0001010"  then -- 8 XOR
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('0' & IR(2 downto 0)); 
                MB<='0'; 
                FS<="1010"; 
                MD<='0'; 
                RW<='1'; 
                MM<='X'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="0001011"  then -- 9 NOT
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; FS<="1011"; 
                MD<='0'; 
                RW<='1'; 
                MM<='X'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="0001100"  then -- 10 MOVB
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('X' & IR(5 downto 3)); 
                BX<=('0' & IR(2 downto 0)); 
                MB<='0'; FS<="1100"; 
                MD<='0'; 
                RW<='1'; 
                MM<='X'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="0010000"  then -- 11 LD
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; 
                FS<="XXXX"; 
                MD<='1'; 
                RW<='1'; 
                MM<='0'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="0100000"  then -- 12 ST
                IL<='0'; 
                ps<="01"; 
                DX<=('X' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('0' & IR(2 downto 0)); 
                MB<='0'; 
                FS<="XXXX"; 
                MD<='X'; 
                RW<='0'; 
                MM<='0'; 
                MW<='1'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="1001100"  then -- 13 LDI
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('X' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='1'; 
                FS<="1100"; 
                MD<='0'; 
                RW<='1'; 
                MM<='0'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="1000010"  then -- 14 ADI
                IL<='0'; 
                ps<="01"; 
                DX<=('0' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='1'; 
                FS<="0010"; 
                MD<='0'; 
                RW<='1'; 
                MM<='0'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="1100000" and Z='1'  then -- 15 BRZ
                IL<='0'; 
                ps<="10"; 
                DX<=('X' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; 
                FS<="0000"; 
                MD<='X'; 
                RW<='0'; 
                MM<='0'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="1100000" and Z='0'  then -- 16 BRZ
                IL<='0'; 
                ps<="01"; 
                DX<=('X' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; 
                FS<="0000"; 
                MD<='X'; 
                RW<='0'; 
                MM<='0'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="1100001" and N='1'  then -- 17 BRN
                IL<='0'; 
                ps<="10"; 
                DX<=('X' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; 
                FS<="0000"; 
                MD<='X'; 
                RW<='0'; 
                MM<='0'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="1100001" and N='0'  then -- 18 BRN
                IL<='0'; 
                ps<="01"; 
                DX<=('X' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; 
                FS<="0000"; 
                MD<='X'; 
                RW<='0'; 
                MM<='0'; 
                MW<='0'; 
                ns <= inf; 
                
            elsif IR(15 downto 9)="1110000" then -- 19 JMP
                IL<='0'; 
                ps<="11"; 
                DX<=('X' & IR(8 downto 6)); 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; 
                FS<="0000"; 
                MD<='X'; 
                RW<='0'; 
                MM<='0'; 
                MW<='0'; 
                ns <= inf; 
                 
           
           --- EXO -> INF
            elsif IR(15 downto 9)="0001101" and Z='1' then -- 23 SRM(2)
            IL<='0'; 
            PS<="01"; 
            DX<="1000"; 
            AX<=('0' & IR(5 downto 3)); 
            BX<=('X' & IR(2 downto 0)); 
            MB<='X'; 
            FS<="0000"; 
            MD<='0'; 
            RW<='1'; 
            MM<='X'; 
            MW<='0'; 
            ns <= inf;  
            
            elsif IR(15 downto 9)="0001110" and Z='1' then  -- 31 SLM(2)
            IL<='0'; 
            ps<="01"; 
            DX<="1000"; 
            AX<=('0' & IR(5 downto 3)); 
            BX<=('X' & IR(2 downto 0)); 
            MB<='X'; 
            FS<="0000"; 
            MD<='0'; 
            RW<='1'; 
            MM<='X'; 
            MW<='0'; 
            ns <= inf; 
                    
           --- EX0 -> EX1
             elsif IR(15 downto 9)="0010001" then -- 20 LRI(1)
                IL<='0'; 
                PS<="00";
                DX<="1000"; 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; 
                FS<="0000"; 
                MD<='1'; 
                RW<='1'; 
                MM<='0'; 
                MW<='0'; 
                ns <= EX1;  
             
             elsif IR(15 downto 9)="0001101" and Z='0' then -- 22 SRM(1) 
                IL<='0'; 
                PS<="00"; 
                DX<="1000"; 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; 
                FS<="0000"; 
                MD<='0'; 
                RW<='1'; 
                MM<='X'; 
                MW<='0'; 
                ns <= EX1;  
             
             elsif IR(15 downto 9)="0001110" and Z='0' then -- 30 SLM(1)
                IL<='0'; 
                ps<="00"; 
                DX<="1000"; 
                AX<=('0' & IR(5 downto 3)); 
                BX<=('X' & IR(2 downto 0)); 
                MB<='X'; 
                FS<="0000"; 
                MD<='0'; 
                RW<='1'; 
                MM<='X'; 
                MW<='0'; 
          
           end if;
           
           --- **EX1** ---
        when EX1 =>  --- EX1 -> EX2
               if IR(15 downto 9)="0001101" and Z='0' then -- 24 SRM(3)
                    IL<='0'; 
                    PS<="00"; 
                    DX<="1001"; 
                    AX<=('X' & IR(5 downto 3)); 
                    BX<=('X' & IR(2 downto 0)); 
                    MB<='1'; 
                    FS<="1100"; 
                    MD<='0'; 
                    RW<='1';
                    MM<='X';
                    MW<='0'; 
                    ns <= EX2;  
                    
               elsif IR(15 downto 9)="0001110" and Z='0' then -- 32 SLM(3)
                    IL<='0'; 
                    ps<="00"; 
                    DX<="1001"; 
                    AX<=('X' & IR(5 downto 3)); 
                    BX<=('X' & IR(2 downto 0)); 
                    MB<='1'; 
                    FS<="1100"; 
                    MD<='0'; 
                    RW<='1'; 
                    MM<='X'; 
                    MW<='0'; 
                    ns <= EX2;  
                    
                     --- EX1 -> INF 
               elsif IR(15 downto 9)="0001101" and  Z='1' then 
                    IL<='0'; 
                    PS<="01"; 
                    DX<="1001"; 
                    AX<=('X' & IR(5 downto 3)); 
                    BX<=('X' & IR(2 downto 0)); 
                    MB<='1'; 
                    FS<="1100"; 
                    MD<='0'; 
                    RW<='1'; 
                    MM<='X'; 
                    MW<='0'; 
                    ns <= inf;  -- 25 SRM(4)
            
            elsif IR(15 downto 9)="0001110" and Z='1' then 
                    IL<='0'; 
                    ps<="01"; 
                    DX<="1001"; 
                    AX<=('X' & IR(5 downto 3)); 
                    BX<=('X' & IR(2 downto 0)); 
                    MB<='1'; FS<="1100"; 
                    MD<='0'; RW<='1'; MM<='X'; MW<='0'; ns <= inf; -- 31 SLM(4)
            
            elsif IR(15 downto 9)="0010001" then 
                    IL<='0'; 
                    PS<="01"; 
                    DX<=('0' & IR(8 downto 6)); 
                    AX<="1000"; 
                    BX<=('X' & IR(2 downto 0)); 
                    MB<='X'; 
                    FS<="0000"; 
                    MD<='1'; 
                    RW<='1'; 
                    MM<='0'; 
                    MW<='0'; 
                    ns <= inf;  -- 21 LRI(2)        
           end if;
         
            
           --- **EX2** ---
        when EX2 => --- EX2 -> EX3  
               if IR(15 downto 9)="0001110" then -- 32 SLM(5)
                 IL<='0'; 
                 ps<="00"; 
                 DX<="1000"; 
                 AX<=('X' & IR(5 downto 3)); 
                 BX<="1000"; 
                 MB<='0'; 
                 FS<="1110"; 
                 MD<='0'; 
                 RW<='1'; 
                 MM<='X'; 
                 MW<='0'; 
                 ns<=EX3;  
                 
               elsif IR(15 downto 9)="0001101" then  -- 26 SRM(5)
                 IL<='0'; 
                 PS<="00"; 
                 DX<="1000"; 
                 AX<=('X' & IR(5 downto 3)); 
                 BX<="1000"; 
                 MB<='0'; 
                 FS<="1101"; 
                 MD<='0'; 
                 RW<='1'; 
                 MM<='X'; 
                 MW<='0'; 
                 ns<=EX3;
               end if;
   
   
           --- **EX3** ---   
        when EX3 => --- EX3 -> EX4 
               if IR(15 downto 9)="0001110" and Z='1' then 
                    IL<='0'; 
                    ps<="00"; 
                    DX<="1001"; 
                    AX<="1001"; 
                    BX<=('X' & IR(2 downto 0)); 
                    FS<="0110"; 
                    MD<='0'; 
                    RW<='1'; 
                    MW<='0'; 
                    ns<=EX4;  -- 34 SLM(7)
           
               elsif IR(15 downto 9)="0001101" and Z='1' then -- 28 SRM(7)
                    IL<='0'; 
                    PS<="00"; 
                    DX<="1001"; 
                    AX<="1001"; 
                    BX<=('X' & IR(2 downto 0));
                    MB<='X'; 
                    FS<="0110"; 
                    MD<='0'; 
                    RW<='1'; 
                    MM<='X'; 
                    MW<='0'; 
                    ns<=EX4;  
            
           --- EX3 -> EX2
                elsif IR(15 downto 9)="0001110" and Z='0' then -- 33 SLM(6)
                    IL<='0'; 
                    ps<="00"; 
                    DX<="1001"; 
                    AX<="1001"; 
                    BX<=('X' & IR(2 downto 0)); 
                    MB<='X'; 
                    FS<="0110"; 
                    MD<='0'; 
                    RW<='1'; 
                    MM<='X'; 
                    MW<='0'; 
                    ns<=EX2; 
                
                elsif IR(15 downto 9)="0001101" and Z='0' then -- 27 SRM(6)
                    IL<='0'; 
                    PS<="00"; 
                    DX<="1001"; 
                    AX<="1001"; 
                    BX<=('X' & IR(2 downto 0)); 
                    MB<='X'; 
                    FS<="0110"; 
                    MD<='0'; 
                    RW<='1'; 
                    MM<='X'; 
                    MW<='0'; 
                    ns<=EX2; 
              end if;
       
           --- **EX4** --- 
        when EX4 => --- EX4 -> INF
               if IR(15 downto 9)="0001101" then -- 29 SRM(8)
                 IL<='0'; 
                 PS<="01"; 
                 DX<=('0' & IR(8 downto 6)); 
                 AX<="1000"; 
                 BX<=('X' & IR(2 downto 0)); 
                 MB<='X'; 
                 FS<="0000"; 
                 MD<='0'; 
                 RW<='1'; 
                 MM<='X'; 
                 MW<='0'; 
                 ns <= inf;  
               
              elsif IR(15 downto 9)="0001110" then -- 35 SLM(8
                 IL<='0'; 
                 ps<="01"; 
                 DX<=('0' & IR(8 downto 6)); 
                 AX<="1000"; 
                 BX<=('X' & IR(2 downto 0)); 
                 MB<='X'; 
                 FS<="0000"; 
                 MD<='0'; 
                 RW<='1'; 
                 MM<='X';
                 MW<='0'; 
                 ns <= inf; 
              end if;
        
            when others =>
            ns <= inf;
        end case;
        
    end process;
end IDC_Behavioral;

