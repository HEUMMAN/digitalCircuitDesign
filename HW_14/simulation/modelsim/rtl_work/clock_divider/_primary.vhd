library verilog;
use verilog.vl_types.all;
entity clock_divider is
    generic(
        input_hz        : integer := 6;
        output_hz       : integer := 1;
        in_out_ratio    : vl_notype
    );
    port(
        reset           : in     vl_logic;
        clock_in        : in     vl_logic;
        clock_out       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of input_hz : constant is 1;
    attribute mti_svvh_generic_type of output_hz : constant is 1;
    attribute mti_svvh_generic_type of in_out_ratio : constant is 3;
end clock_divider;
