response_matching = simple_matching;
active_buttons = 3; 
button_codes = 1,2,3;
scenario = "MRI Behv Part";    
scenario_type = trials;
#no_logfile = true;
#8 = half of refreshing rate at 60Hz display
pcl_file = "mri_behv.pcl";

begin; 
picture {} default;   

picture {
   text{     
      caption = "+";
      font_size = 48;
      font_color = 255,255,255;
   }; 
   x=0;y=0;
}fixation;

trial{        
   trial_duration = forever;
   trial_type=first_response; 
   all_responses=false;
   stimulus_event{
      picture fixation;     
      time = 0;   
      #code="fixation";
   }fixation_event;
}main_trial; 
