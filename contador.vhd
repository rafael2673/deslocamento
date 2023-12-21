library ieee;
use ieee.std_logic_1164.all;

entity contador is
    port (clk, clear, incrementa, decrementa: in std_logic;
          valor: out std_logic_vector(2 downto 0));
end contador;

architecture behavior of contador is
	component somador_3_bits is
		port(B, M: in std_logic;
			  A: in std_logic_vector (2 downto 0);
			  Co: out std_logic;
			  S: out std_logic_vector (2 downto 0));
	end component;
	component registrador_3_bits is
		port (ck, clr, set: in  std_logic;
				d: in std_logic_vector(2 downto 0);
				q : out std_logic_vector(2 downto 0)
				);
	end component;
	signal co: std_logic;
	signal led_register, valor_register: std_logic_vector(2 downto 0):="000";
begin
	sum0: somador_3_bits port map(incrementa, decrementa, led_register, co, valor_register);
	register0: registrador_3_bits port map(clk, clear, '1', valor_register, led_register);
   valor <= valor_register;
end behavior;
