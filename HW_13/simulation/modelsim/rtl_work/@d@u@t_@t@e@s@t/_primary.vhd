library verilog;
use verilog.vl_types.all;
entity DUT_TEST is
    port(
        clk1            : in     vl_logic;
        rst1            : in     vl_logic;
        out1            : out    vl_logic
    );
end DUT_TEST;
