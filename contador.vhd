library ieee;
use ieee.std_logic_1164.all;

entity contador is
    port (inicio: in std_logic_vector(2 downto 0);
          incrementa, decrementa: in std_logic;
          valor: out std_logic_vector(2 downto 0));
end contador;

architecture behavior of contador is
	component somador_3_bits is
		port(B, M: in std_logic;
			  A: in std_logic_vector (2 downto 0);
			  Co: out std_logic;
			  S: out std_logic_vector (2 downto 0));
	end component;

	signal co: std_logic;
	
begin
	sum0: somador_3_bits port map(incrementa, decrementa, inicio, co, valor);
    
end behavior;
