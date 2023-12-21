library ieee ;
use ieee.std_logic_1164 .all;

entity somador_3_bits is
	port(B, M: in std_logic;
		  A: in std_logic_vector (2 downto 0);
		  Co: out std_logic;
		  S: out std_logic_vector (2 downto 0));
end somador_3_bits;

architecture soma of somador_3_bits is

	component full_adder is
		port(A, B, Ci: in std_logic;
			  S, Co: out std_logic);
	end component;

	signal I2, I1, I0, C1, C0: std_logic;
	
begin
	
	I0 <= (M xor B) and B;
	I1 <= (M xor B) and M;
	I2 <= (M xor B) and M;
	
	SOMA0 : full_adder port map(A(0), I0, M, S(0), C0);
	SOMA1 : full_adder port map(A(1), I1, C0, S(1), C1);
	SOMA2 : full_adder port map(A(2), I2, C1, S(2), Co);

end soma;