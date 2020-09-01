library verilog;
use verilog.vl_types.all;
entity clock_divider is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        clk1            : out    vl_logic;
        clk2            : out    vl_logic;
        clk3            : out    vl_logic;
        clk4            : out    vl_logic
    );
end clock_divider;
