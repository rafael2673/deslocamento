library ieee;
use ieee.std_logic_1164.all;

entity mux_8x1_8_bits is
   port (S: in std_logic_vector(2 downto 0);
			saida: out std_logic_vector(7 downto 0));
end mux_8x1_8_bits;

architecture logica of mux_8x1_8_bits is
	
begin
	process (S)
		begin
			case S is
				when "000" => saida <= "00000001";
				when "001" => saida <= "00000010";
				when "010" => saida <= "00000100";
				when "011" => saida <= "00001000";
				when "100" => saida <= "00010000";
				when "101" => saida <= "00100000";
				when "110" => saida <= "01000000";
				when "111" => saida <= "10000000";
			end case;
	end process;
	
end logica;