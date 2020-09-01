library verilog;
use verilog.vl_types.all;
entity clock_divider_vlg_check_tst is
    port(
        clk1            : in     vl_logic;
        clk2            : in     vl_logic;
        clk3            : in     vl_logic;
        clk4            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end clock_divider_vlg_check_tst;
