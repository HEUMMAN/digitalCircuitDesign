library verilog;
use verilog.vl_types.all;
entity negative_tri_state_buffer_N_bit is
    generic(
        N               : integer := 7
    );
    port(
        in_disable      : in     vl_logic;
        \in\            : in     vl_logic_vector;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end negative_tri_state_buffer_N_bit;
