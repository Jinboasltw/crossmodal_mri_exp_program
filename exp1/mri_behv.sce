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

trial{        
   trial_duration = forever;
   trial_type=specific_response; 
   terminator_button  = 3;
   
   stimulus_event{
      picture welcome;
      deltat = 92; 
      #code="welcome"; 
      
   }welcome_event;
}welcome_trial;

trial{        
   trial_duration = 1000;
   picture fixation;     
   time = 0;
}main_trial;

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