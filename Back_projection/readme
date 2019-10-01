Information about matlab scripts and functions what they do?
######################################################################
Scripts:

Cross_correlation.m >> this scripts do data formatting it converts data files from data prep step to matrix form to be used in matlab.

rupture_back_projection.m >> this the master script which do the backprojection. Main controls here are the frequency band, event depht , mesh of potential sources around the epicenter at present (would be around hypocenter in future )

########################################################################
user defined functions :
 amp_sign.m >> this returns the index number at perticular time in the data file which its phase information 

 averaging.m >> this function does the moving window average at the moment tailored for 1s.

 crosscorr_allign.m >> this function does the cross-correlation between two traces. Window of cross-correlation and where to start window has be set in the function definition. This window length and where to start are crucial and has be set by trying different values and fixing accordingly.

cut_window.m >> this function cut the trace/waveform from a certain starting index and of fixed length given as arguments to the function.


stack_plot.m >> this script does the cross-correlation of the traces and produces corrected and un-corrected data which then can be used to plot individual traces and calculate STF by just summing the corrected traces. This script is handy in deciding on cross-correlation window lenght and where to start the window to be finally used in the back-projection. It only does the data producing job. Visualisation of the corrected and uncorrected traces are done by the following script.

trace_plot.m >> this script plot the corrected and un-corrected traces with respect to dist az or baz based on user choice which tailored in the script. This script needs info_matlab_{arraycode}.txt file which is nothing but data_info_{array code}.txt wihtout trace name which can be easily generated using "the great awk !!" on this file. This handy in visualising the cross-correled traces.Plots are generated such that they are in publication ready format all you have do is just save the plot file in your preffered format.
##########################################################################
combinig back-projection results from multiple arrays.

This can be done in two way one is to just sum them up and other is to also cross-correlate them to account for some array specific delay or advance

combine_arrays.m >> this scrip had diffrent line to load different array files and them sum them and in the end following lines where 2D spatial smoothenig is done on final result which very crucial for smooth plots and choice of is subjective with some experince of stuff. here is one suggestion , one can try different values and then decide on what to use what to infer from this  
  h=fspecial('average',[10 20]);
  b=filter2(h,beam_sum);

net_stack_allign.m >> this script does more sophisticated combining of different array by corr-correaltion with a refence array trace (AU for most cases beacuse Indian earthquakes is has got the best aperture). Now cross-correlation is done between the traces which at the epicenter of the earthquake.  

###########################################################################
back-projection visualisation scripts to get the hang how are you doing with your back-projection. More sophisticated plots can be generated in GMT which other information you want to plug in. (GMT plotting scripts are also provided)

cumulative_plot.m >> this function plot the cumulative energy. Plotting bounds have be given inside the function definition and to reference yourself epicenter/ centroid locations can also be plotted.

peak_time_wise.m >> this function plot the location of peak amplitude at each time . other descriptions are same as the above function

############################################################################







Sequence in which to run the scripts

1. First you need to have taup tool kit in your path. To do that you have to go to the  */Back_projection_package/resources/seizmo directory while in the matlab than run the startup_seizmo.m script, now you will have the functions of taup tool kit as you have in bashshell.

2. copy the V_{arrayname}.txt , T_{arrayname}.txt  and all info files that you generated to the back_projection folder.

3.Now open Cross_correlation.m scaript and change parameter accordingly and run it. This will give to output files named v.txt and t.txt which are files usable in further scripts. Just move them to the format v_{arrayname}.txt and t_{arrayname}.txt

4. Now you can rupture_back_projection.m and output of it stored in temp variable which you can save and plot.  

