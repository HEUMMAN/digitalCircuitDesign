library verilog;
use verilog.vl_types.all;
entity ring_counter_4_bit is
    port(
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        \out\           : out    vl_logic_vector(3 downto 0)
    );
end ring_counter_4_bit;
