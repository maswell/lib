%========================================================================
%        author      : xiaomh                               
%        email       : masw@masw.tech     
%        creattime   : 2019 7/ 4 13:43:50 2019
%        file format : utf-8
%        license     : Apache 2.0
%========================================================================
%% progress bar function 
function progbar(perc, str) 
persistent bartap;
persistent last_time;
persistent last_perc;



if(isempty(last_time)) 
	last_time = now;
	last_perc = perc;
else
	curr_time = now;
	curr_perc = perc;
	diff_perc = curr_perc - last_perc;
	diff_time = curr_time - last_time;  
    
	totl_time = diff_time / diff_perc;
	rema_time = totl_time * (1-perc) ; 
    disp_time = datevec(rema_time);
    disp_time2 = disp_time(6) + ...
                 disp_time(5)*60 + ...
                 disp_time(4)*60*60 + ...
                 disp_time(3)*60*60*24 ;
	disp_str = sprintf("%s, progress:%2.2f%%, time remaining:%.4fs",str,perc*100, disp_time2); 
	last_time = curr_time;
	last_perc = curr_perc;
	if(isempty(bartap))
		bartap = waitbar(0, str); 
	else
		bartap = waitbar(perc, bartap, disp_str); 
	end	
end
if perc == 1
	close(bartap) 
	clear bartap ;
	clear last_time;
	clear last_perc;
end


end















