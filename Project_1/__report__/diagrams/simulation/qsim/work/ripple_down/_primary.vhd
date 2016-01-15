library verilog;
use verilog.vl_types.all;
entity ripple_down is
    port(
        Q_3             : out    vl_logic;
        RESET           : in     vl_logic;
        CLOCK           : in     vl_logic;
        Q_2             : out    vl_logic;
        Q_1             : out    vl_logic;
        Q_0             : out    vl_logic
    );
end ripple_down;
