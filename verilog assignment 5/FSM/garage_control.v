
module garage_control (
input  wire        Activate , UP_Max , DN_Max,
input  wire        clk, rst,

output reg         UP_M, DN_M
);


localparam  [2:0]    IDLE  = 3'b000,
                     Mv_Up = 3'b011,
                     Mv_Dn = 3'b101;					 
										 
reg    [2:0]         current_state,
                     next_state ;
					 
// state transition 		
always @(posedge clk or negedge rst)
 begin
  if(!rst)
   begin
     current_state <= IDLE ;
   end
  else
   begin
     current_state <= next_state ;
   end
 end
 
// next_state logic
always @(*)
 begin
  case(current_state)
  IDLE     : begin
              if(!Activate)
			   next_state = IDLE;
              else if (UP_Max)
               next_state = Mv_Dn;
			  else if (DN_Max)
               next_state = Mv_Up;			   
             end
			 
  Mv_Dn    : begin
              if(DN_Max)
			   next_state = IDLE ;	   
            end
			
  Mv_Up    : begin
              if(UP_Max)
			   next_state = IDLE ;   
            end
			
   default :   next_state = IDLE ;		 
  
  endcase
end	


// next_state logic
always @(*)
 begin
  case(current_state)
  IDLE     : begin
              UP_M   =  1'b0;
			  DN_M   =  1'b0;
             end
  Mv_Dn    : begin
              UP_M   =  1'b0;
			  DN_M   =  1'b1;
             end	
  Mv_Up    : begin
              UP_M   =  1'b1;
			  DN_M   =  1'b0;	   
             end
  default  : begin
              UP_M   =  1'b0;
			  DN_M   =  1'b0;
             end			  
  endcase
 end	
		
		
endmodule					 