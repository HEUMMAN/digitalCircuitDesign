library verilog;
use verilog.vl_types.all;
entity structural_mux is
    port(
        s               : in     vl_logic_vector(7 downto 0);
        sel             : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic
    );
end structural_mux;
