#--------------------------------------------------------------
#                            Header
#--------------------------------------------------------------
response_matching = simple_matching;
active_buttons = 3; 
button_codes = 1,2,3; 
scenario = "MRI Behv Part";    
scenario_type = trials;
$left_response = 1;
$refreshrate = 144;
$interval = '1000/$refreshrate';

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
	/*
   text{
      caption = "Welcome";
      font_size = 36;
      font_color = 100,200,200;
   };*/
	bitmap { filename = "instruction_exp_part1.bmp"; preload = true; } ;
   x = 0;y = 0;
}welcome_1;

picture {
	/*
   text{
      caption = "Welcome";
      font_size = 36;
      font_color = 100,200,200;
   };*/
	bitmap { filename = "instruction_exp_part2.bmp"; preload = true; } ;
   x = 0;y = 0;
   text {
      caption = "(Press Start button to practice)";
		font_size = 24; 
   }welcome_text; 
   x = 540; y = -400;
}welcome_2;
      
picture {
   /*
   text{     
      caption = "+";
      font_size = 48;
      font_color = 255,255,255;
   };
   */
   bitmap { filename = "fixation.bmp"; preload = true; } ;
   x=0;y=0;
}fixation; 

picture {
   text{
      caption = "ACC";
      font_size = 24;
      font_color = 255,255,255;
   }acc;
   x = 0;y = 60;
   text {
      caption = "RT"; 
      font_size = 24;
      font_color = 255,255,255;
   }rt; 
   x = 0; y = 0;
   text {
      caption = "Suggest"; 
      font_size = 24;
      font_color = 255,0,255;
   }sug; 
   x = 0; y = -60;
}feed_back;

picture {
   text{
      caption = "PC";
      font_size = 24;
      font_color = 255,255,255;
   }tacc;
   x = 0;y = 60; 
   text {
      caption = "Suggest"; 
      font_size = 24;
      font_color = 255,0,255;
   }tsug; 
   x = 0; y = 0;
   text {
      caption = "(Press Start button to continue)"; 
   }; 
   x = 0; y = -400;
}summary;

picture {
   text{
      caption = "Take a Break";
      font_size = 36;
      font_color = 100,200,200;
   };
   x = 0;y = 0;
   text {
      caption = "(Press Start button to continue)"; 
   }; 
   x = 0; y = -400;
}relax;
    
picture {
   text{
      caption = "temp";
      font_size = 36;
      font_color = 100,200,200;
   }block_info;
   x = 0;y = 0;
   text {
      caption = "(Press Start button to continue)"; 
   }; 
   x = 0; y = -400;
}block;
        
picture {
   text{
      caption = "That's All. Thank You.";
      font_size = 36;
      font_color = 100,200,200;
   };
   x = 0;y = 0;
   text {
      caption = "(Press Start button to exit)"; 
   }; 
   x = 0; y = -400;
}bye;
#--------------------------------------------------------------
#                          Timming Setup
#--------------------------------------------------------------
$loading = 1000;
$welcome_show_button_delay = 5000; 
$fixation_show_at = 0; 
$snd_show_at = 100;  
$vis_show_at = 101;
$blank_show_at = 'int(100-0.5*$interval)'; 
$feedback_duration = 1000; 
#--------------------------------------------------------------
#                          Trial Setup
#--------------------------------------------------------------

trial{        
   trial_duration = $loading;
   picture {
      text{     
         caption = "Loading...";
         font_size = 24;
         font_color = 255,0,0;
      }; 
      x=0;y=0;
   }loading;     
   time = 0;
}loading_trial;

trial{        
   trial_duration = $loading;
   picture {
      text{     
         caption = "loading success!";
         font_size = 24;
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
      picture welcome_1;
      time = 0;
		#deltat = 0; 
      code="welcome";       
   }welcome_event;

   picture welcome_2;
   time = $welcome_show_button_delay;
}welcome_trial;

trial{        
   trial_duration = forever;   
   #trial_duration = 100;# preview
   trial_type=first_response; 
   all_responses=false;
   
   stimulus_event {
      picture fixation;     
      time = $fixation_show_at; 
      code="fix";
		response_active = false;
   } pfix_event;

   stimulus_event  {  
      # placeholder - set by PCL
      sound snd1;  
      # time = 'int(100-0.5*$interval)';
		time = $snd_show_at;
      response_active = true;
      target_button = $left_response;
      code="snd"; 
   } psnd_event;

   stimulus_event  {  
      # placeholder - set by PCL
      picture pic1;
      #time = 'int(100-0.5*$interval)';
		time = $vis_show_at;
		response_active = false;
      code="vis"; 
   } pvis_event;
                
   stimulus_event  {  
      picture fixation; 
      deltat = $blank_show_at;
		response_active = false;
      code="blankScreen"; 
   } pbk_event;
                
}pmain_trial;

trial{        
   trial_duration = $feedback_duration;
   
   stimulus_event{
      picture feed_back;
      time = 0; 
      code="feed";       
   }feed_back_event;
}feed_back_trial;

trial{        
   trial_duration = forever;
   trial_type=specific_response; 
   terminator_button  = 3;
   
   stimulus_event{
      picture summary;
      time = 0;
      #deltat = 0; 
      code="summary";       
   }summary_event;
}summary_trial;

trial{        
   trial_duration = forever;   
   #trial_duration = 100;# preview
   trial_type=first_response; 
   all_responses=false;
   
   stimulus_event {
      picture fixation;     
      time = $fixation_show_at; 
      code="fix";
		response_active = false;
   } fix_event;

   stimulus_event  {  
      # placeholder - set by PCL
      sound snd1;  
      # time = 'int(100-0.5*$interval)';
		time = $snd_show_at;
      response_active = true;
      target_button = $left_response;
      code="snd"; 
   } snd_event;

   stimulus_event  {  
      # placeholder - set by PCL
      picture pic1;
      #time = 'int(100-0.5*$interval)';
		time = $vis_show_at;
		response_active = false;
      code="vis"; 
   } vis_event;
                
   stimulus_event  {  
      picture fixation; 
      deltat = $blank_show_at;
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
      time = 92; 
      code="relax";       
   }relax_event;
}relax_trial;

trial{        
   trial_duration = forever;
   trial_type=specific_response; 
   terminator_button  = 3;
   
   stimulus_event{
      picture block;
      time = 92; 
      code="block";       
   }block_event;
}block_trial;

trial{        
   trial_duration = forever;
   trial_type=specific_response; 
   terminator_button  = 3;
   
   stimulus_event{
      picture bye;
      time = 92; 
      code="bye";       
   }bye_event;
}bye_trial;