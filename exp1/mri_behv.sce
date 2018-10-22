#--------------------------------------------------------------
#                            Header
#--------------------------------------------------------------
response_matching = simple_matching;
active_buttons = 3; 
button_codes = 1,2,3; 
$left_response = 1;
$interval = '1000/60';
scenario = "MRI Behv Part";    
scenario_type = trials;
#no_logfile = true;
#8 = half of refreshing rate at 60Hz display 
#--------------------------------------------------------------
#                        PCL File Setup
#--------------------------------------------------------------
pcl_file = "mri_behv.pcl";

begin;
picture {} default;  
#--------------------------------------------------------------
#                          Stim Prepare
#--------------------------------------------------------------
array {    
   picture{bitmap { filename = "stim_HB_B.bmp"; preload = true; } HB_B;x = 0; y = 0;}pic1;
   picture{bitmap { filename = "stim_HB_S.bmp"; preload = true; } HB_S;x = 0; y = 0;};
   picture{bitmap { filename = "stim_LB_B.bmp"; preload = true; } LB_B;x = 0; y = 0;}; 
   picture{bitmap { filename = "stim_LB_S.bmp"; preload = true; } LB_S;x = 0; y = 0;}; 
   picture{bitmap { filename = "stim_NONE.bmp"; preload = true; } NONE;x = 0; y = 0;};
} pics;

array {
   sound{wavefile { filename = "H_L_2.wav"; preload = true;}HL2;}snd1;  
   sound{wavefile { filename = "H_L_1.wav"; preload = true;}HL1;};
   sound{wavefile { filename = "H_Z.wav"; preload = true;}HZ;};
   sound{wavefile { filename = "H_R_1.wav"; preload = true;}HR1;};
   sound{wavefile { filename = "H_R_2.wav"; preload = true;}HR2;};
       
   sound{wavefile { filename = "L_L_2.wav"; preload = true;}LL2;};
   sound{wavefile { filename = "L_L_1.wav"; preload = true;}LL1;};
   sound{wavefile { filename = "L_Z.wav"; preload = true;}LZ;};
   sound{wavefile { filename = "L_R_1.wav"; preload = true;}LR1;};
   sound{wavefile { filename = "L_R_2.wav"; preload = true;}LR2;};
} snds;

#--------------------------------------------------------------
#                          Element Prepare
#--------------------------------------------------------------
picture {
   text{
      caption = "Welcome";
      font_size = 36;
      font_color = 100,200,200;
   };
   x = 0;y = 0;
   text {
      caption = "(Press Tab button to continue)"; 
   }; 
   x = 0; y = -200;
}welcome;
       
picture {
   text{     
      caption = "+";
      font_size = 48;
      font_color = 255,255,255;
   }; 
   x=0;y=0;
}fixation; 

picture {
   text{
      caption = "Relax";
      font_size = 36;
      font_color = 100,200,200;
   };
   x = 0;y = 0;
   text {
      caption = "(Press Tab button to continue)"; 
   }; 
   x = 0; y = -200;
}relax;
    
picture {
   text{
      caption = "Block";
      font_size = 36;
      font_color = 100,200,200;
   };
   x = 0;y = 0;
   text {
      caption = "(Press Tab button to continue)"; 
   }; 
   x = 0; y = -200;
}block;
        
picture {
   text{
      caption = "Bye";
      font_size = 36;
      font_color = 100,200,200;
   };
   x = 0;y = 0;
   text {
      caption = "(Press Tab button to exist)"; 
   }; 
   x = 0; y = -200;
}bye;

#--------------------------------------------------------------
#                          Trial Setup
#--------------------------------------------------------------
trial{        
   trial_duration = 100;
   picture {
      text{     
         caption = "loading seq...";
         font_size = 48;
         font_color = 255,255,255;
      }; 
      x=0;y=0;
   }loading;     
   time = 0;
}loading_trial;

trial{        
   trial_duration = 1000;
   picture {
      text{     
         caption = "loading seq: sucess!";
         font_size = 48;
         font_color = 0,255,0;
      }; 
      x=0;y=0;
   }done;     
   time = 0;
}done_trial;

trial{        
   trial_duration = forever;
   trial_type=specific_response; 
   terminator_button  = 3;
   
   stimulus_event{
      picture welcome;
      time = 0;
		#deltat = 0; 
      code="welcome";       
   }welcome_event;
}welcome_trial;

trial{        
   trial_duration = forever;   
   #trial_duration = 100;# preview
   trial_type=first_response; 
   all_responses=false;
   
   stimulus_event {
      picture fixation;     
      time = 0; 
      code="fix";
		response_active = false;
   } fix_event;

   stimulus_event  {  
      # placeholder - set by PCL
      sound snd1;  
      time = 'int(100-0.5*$interval)';
      response_active = true;
      target_button = $left_response;
      code="snd"; 
   } snd_event;

   stimulus_event  {  
      # placeholder - set by PCL
      picture pic1;
      time = 'int(100-0.5*$interval)';
		response_active = false;
      code="vis"; 
   } vis_event;
                
   stimulus_event  {  
      picture fixation; 
      time = 'int(200-0.5*$interval)';
		response_active = false;
      code="blankScreen"; 
   } bk_event;
                
}main_trial;

trial{        
   trial_duration = 650;
   #trial_duration = 10;# preview
   picture fixation;      
   time = 0;
}interval_trials;

trial{        
   trial_duration = forever;
   trial_type=specific_response; 
   terminator_button  = 3;
   
   stimulus_event{
      picture relax;
      deltat = 92; 
      code="relax";       
   }relax_event;
}relax_trial;

trial{        
   trial_duration = forever;
   trial_type=specific_response; 
   terminator_button  = 3;
   
   stimulus_event{
      picture block;
      deltat = 92; 
      code="block";       
   }block_event;
}block_trial;

trial{        
   trial_duration = forever;
   trial_type=specific_response; 
   terminator_button  = 3;
   
   stimulus_event{
      picture bye;
      deltat = 92; 
      code="bye";       
   }bye_event;
}bye_trial;