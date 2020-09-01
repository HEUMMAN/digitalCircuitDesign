library verilog;
use verilog.vl_types.all;
entity fnd_driver is
    port(
        in_BCD          : in     vl_logic_vector(3 downto 0);
        out_FND         : out    vl_logic_vector(6 downto 0)
    );
end fnd_driver;
