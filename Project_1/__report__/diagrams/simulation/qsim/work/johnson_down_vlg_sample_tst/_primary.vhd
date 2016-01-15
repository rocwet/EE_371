library verilog;
use verilog.vl_types.all;
entity johnson_down_vlg_sample_tst is
    port(
        CLOCK           : in     vl_logic;
        RESET           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end johnson_down_vlg_sample_tst;
