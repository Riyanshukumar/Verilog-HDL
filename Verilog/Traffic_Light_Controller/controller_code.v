module traffic_light(c, clk, rst_n, light_farm, light_highway);
    input c, clk, rst_n;
    output reg [2:0] light_farm, light_highway;

    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    parameter red = 3'b100, yellow = 3'b010, green = 3'b001;

    reg [1:0] state, next_state;

    always @(posedge clk)
    begin
        if(~rst_n)
            state <= s0;
        else
            state <= next_state;
    end

    always @(state)
    begin
        case(state)
            s0: begin
                light_farm = red;
                light_highway = green;
                
            end
            s1: begin
                light_farm = red;
                light_highway = yellow;
                
            end
            s2: begin
                light_farm <= green;
                light_highway <= red;
               
            end
            s3: begin
                light_farm = yellow;
                light_highway = red;
                
            end
        endcase
    end

    always @(state or c)
    begin
        case(state)
            s0: begin
                if(c)
                    next_state <= s1;
                else
                    next_state <= s0;
            end
            s1: begin
                    #5 next_state <= s2;
            end
            s2: begin
                if(c)
                    next_state <= s2;
                else
                    next_state <= s3;
            end
            s3: begin
                    #5 next_state <= s0;
            end

            default : next_state <= s0;
        endcase
    end

endmodule