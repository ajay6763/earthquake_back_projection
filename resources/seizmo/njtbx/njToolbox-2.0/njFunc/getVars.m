function result=getVars(ncRef)
%getVars - Get list of variables in the dataset.
%
% Usage:
%   vars=getVars(ncRef);
% where,
%   ncRef - Reference to netcdf file. It can be either of two
%           a. local file name or a URL (OpenDAP, ncml) or
%           b. An 'mDataset' matlab object, which is the reference to already
%              open netcdf file.
%              [ncRef=mDataset(uri)]
% returns,      
%   vars - cell array of variable names
%
% e.g.:
%  ncRef='http://coast-enviro.er.usgs.gov/cgi-bin/nph-dods/models/test/bora_feb.nc';
%  vars=getVars(ncRef);
%
% Alexander Crosby, Applied Science Associates 2010
% acrosby@asascience.com  or  crosbyar@gmail.com

result = [];

nc = ncRef; % assign uri to a variable (not really needed)

if isa(ncRef, 'mDataset')
    JAVAOBJECT = ncRef.getJDataset();

    % Use the java methods to report metadata as matlab structs
%     result.title=char(JAVAOBJECT.getGridDataset().getTitle());

    variables = JAVAOBJECT.getJNetcdfDataset().getNetcdfDataset().getVariables();
%     attr=JAVAOBJECT.getJNetcdfDataset().getNetcdfDataset().getGlobalAttributes();
       
else

    % access netcdf java directly 
    JAVAOBJECT = ucar.nc2.dataset.NetcdfDataset.openDataset(nc);

    % Use the java methods to report metadata as matlab structs
%     result.title=char(JAVAOBJECT.getTitle());

    variables = JAVAOBJECT.getVariables();
%     attr=JAVAOBJECT.getGlobalAttributes();
      
end  
      for i = 1:size(variables)
        result{i,1}=char(variables.get(i-1).getName());
%         result.variables{i,2}=variables.get(i-1).getShape();
      end
    
%       for i = 1:size(attr)
%         result.attributes{i,1}=char(attr.get(i-1).getName());
%       end         
    
end

   