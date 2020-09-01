library verilog;
use verilog.vl_types.all;
entity timer_00_59 is
    port(
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        out_1sec_BCD    : out    vl_logic_vector(3 downto 0);
        out_10sec_BCD   : out    vl_logic_vector(3 downto 0);
        out_1min_BCD    : out    vl_logic_vector(3 downto 0);
        out_10min_BCD   : out    vl_logic_vector(3 downto 0)
    );
end timer_00_59;
