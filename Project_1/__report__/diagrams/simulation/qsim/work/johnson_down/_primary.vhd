library verilog;
use verilog.vl_types.all;
entity johnson_down is
    port(
        Q_0             : out    vl_logic;
        RESET           : in     vl_logic;
        CLOCK           : in     vl_logic;
        Q_1             : out    vl_logic;
        Q_2             : out    vl_logic;
        Q_3             : out    vl_logic
    );
end johnson_down;
