clear variables
close all
clc

%%
%addpath('/local/jk72/pw6046')
addpath(genpath('/home/581/pw6046/MATLAB_Toolbox'));
%%

% ------------------------------------------------------------------------
%nc_path = '/g/data/cj50/access-om2/raw-output/access-om2-01/01deg_jra55v140_iaf_cycle4'; %1987-2018
nc_path = '/scratch/jk72/pw6046/ICEBERG/'; %2019-Mar 2022
%%
%export_folder = '/g/data1b/jk72/pw6046/MATLAB/EXPORT/'; %
export_folder = '/scratch/jk72/pw6046/MATLAB_exports';

%% 'Bathymetry'
bathy_nc_file = [nc_path '/' 'topog_renamed.nc'];
tpg_info = ncinfo([nc_path '/' 'topog_renamed.nc']);
tpg_info.Variables.Name;
%% tlat, tlon
grid_nc_file = '/g/data/ik11/inputs/access-om2/input_20200530/cice_025deg/grid.nc';
grid_info = ncinfo('/g/data/ik11/inputs/access-om2/input_20200530/cice_025deg/grid.nc');
grid_info.Variables.Name;
%%
bath = ncread(bathy_nc_file,'Bathymetry');
tlat = ncread(grid_nc_file,'tlat');
tlon = ncread(grid_nc_file,'tlon');

%%
s_ind = 200;
figure
s_tlat = tlat(:,1:s_ind);
s_tlon = tlon(:,1:s_ind);
s_bath = bath(:,1:s_ind);

pcolorps(rad2deg(s_tlat),rad2deg(s_tlon),s_bath)
cmocean('deep')
a=colorbar;
a.Label.String = 'Dan 0.25\circ batheymetry (m)';

exportgraphics(gca,'dan_bath_025.pdf')
export_fig('dan_bath_025_fig.pdf')