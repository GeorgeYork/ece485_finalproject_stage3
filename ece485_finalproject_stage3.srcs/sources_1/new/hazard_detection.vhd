
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity hazard_detection is
    Port (
        id_ex_mem_read : in STD_LOGIC;
        id_ex_rd       : in STD_LOGIC_VECTOR(4 downto 0);
        if_id_rs1      : in STD_LOGIC_VECTOR(4 downto 0);
        if_id_rs2      : in STD_LOGIC_VECTOR(4 downto 0);
        start_stall    : out STD_LOGIC
    );

end hazard_detection;

architecture Behavioral of hazard_detection is

begin
    process(id_ex_mem_read, id_ex_rd, if_id_rs1, if_id_rs2)
    begin
        if (id_ex_mem_read = '1') and 
           ((id_ex_rd = if_id_rs1) or (id_ex_rd = if_id_rs2)) and 
           (id_ex_rd /= "00000") then
            start_stall <= '1';
        else
            start_stall <= '0';
        end if;
    end process


end Behavioral;
