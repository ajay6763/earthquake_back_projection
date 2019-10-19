
> # earthquake_back_projection
> Back-projection of high-frequency radiation from earthquake source using multiple arrays. Methodology is based on Ishii (2012). For details see Kumar et al., 2017 [doi: 10.1093/gji/ggw438]
> #### dependency 
> * Matlab
> * GMT4
> * SEIZMO [http://epsc.wustl.edu/~ggeuler/codes/m/seizmo/]
>        SEIZMO is a toolbox for seismic data porcessing in Matlab and it is mainly used for taup toolkit to calculate travel times of seismic phases.
> ---
> ![Earthquake back-projection method](https://github.com/ajay6763/eaethquake_back_projection/blob/master/BP_EQ.jpg)
> --
>  ## Method
>  - Algorithm as follows:
> 1. The source region, surrounding the hypocentre is parameterized as a horizontal plane with grids. The plane is fixed in space at the hypocentral depth.

> 2. The teleseismic P-wave, from each station within the array, is windowed 30 s before and 150 s after the theoretical arrival time computed using the IASP91 velocity model (Kennett &Engdahl1991).

> 3. Within a given array, the windowed P-waves are cross-correlated with a reference station (chosen at the centre of the array) to estimate the time shift required to account for the 3-dimensional variation in the velocity structure.

> 4. Each grid point on the parameterized hypocentral plane is assumed as a potential source and the travel time of P-wave is calculated, using IASP91 velocity model, to all the stations within the array.

> 5. Waveforms from these stations, adjusted by the respective time shifts (computed from cross-correlation), are stacked together,starting from the calculated P-wave arrival time for a given source grid. During stacking, the waveforms are weighted (i) inversely by the density of stations within an array and (ii) by the cross-correlation coefficient (obtained above).

> 6. The weighted stacked energy is then back projected onto the source grid. This procedure is repeated for all potential source grids,for every array.

> 7. Information from all the arrays are combined by following a weighting procedure, where the stack from the hypocentral grid is cross-correlated for each array, with respect to a chosen reference array.

> 8. For every potential source grid, stacked waveforms from each array are adjusted by the estimated time shift and summed by nor-malizing the amplitude.

> 9. For removing the high-frequency artefacts in the stacked waveform at each potential source grid, a 10 s moving averagetime window is applied. In order to test the influence of the moving average time window on the final result, we performed our analysisfor 5, 10, 15 and 20 s time windows. It was observed that the 10 swindow is optimal in removing unwanted high-frequency artefacts,while preserving the necessary details of the source time function(STF).


