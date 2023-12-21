library ieee;
use ieee.std_logic_1164.all;

entity registrador_3_bits is
   port (ck, clr, set: in  std_logic;
			d: in std_logic_vector(2 downto 0);
         q : out std_logic_vector(2 downto 0)
			);
end registrador_3_bits;

architecture logica of registrador_3_bits is

begin
   process(ck, clr, set)
   begin
      if    (set = '0')            then q <= "111";
      elsif (clr = '0')            then q <= "000";
      elsif (ck'event and ck ='1') then q <= d;   
      end if;   
   end process;   
end logica;