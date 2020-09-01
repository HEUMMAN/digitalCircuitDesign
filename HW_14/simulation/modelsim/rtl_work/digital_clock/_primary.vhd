library verilog;
use verilog.vl_types.all;
entity digital_clock is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        FND3            : out    vl_logic_vector(6 downto 0);
        FND2            : out    vl_logic_vector(6 downto 0);
        FND1            : out    vl_logic_vector(6 downto 0);
        FND0            : out    vl_logic_vector(6 downto 0);
        out_min_tens    : out    vl_logic_vector(3 downto 0);
        out_min_ones    : out    vl_logic_vector(3 downto 0);
        out_sec_tens    : out    vl_logic_vector(3 downto 0);
        out_sec_ones    : out    vl_logic_vector(3 downto 0)
    );
end digital_clock;
