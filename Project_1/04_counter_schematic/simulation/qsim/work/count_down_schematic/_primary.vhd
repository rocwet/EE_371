library verilog;
use verilog.vl_types.all;
entity count_down_schematic is
    port(
        \out\           : out    vl_logic_vector(3 downto 0);
        RESET           : in     vl_logic;
        CLOCK           : in     vl_logic
    );
end count_down_schematic;
