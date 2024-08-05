function [ ret ] = NChoose(sets)  
% Find the  combination of  n sets


% Inputs:
% sets is a cell and in which each element is a vector;
% Outpuss:
% ret:
% ret is a cell and in which each element denotes a combination.
  
setNum = length( sets );  
  
% ?????????  
if 1 == setNum  
    Setj = length( sets{ 1 } );  
    ret = cell( 1, Setj );  
      
    for i = 1 : length( sets{ 1 } )  
        ret{ i } = sets{ 1 }( i );  
    end  
% ???????????????????????????  
else  
    % ??????  
    result = NChoose( sets( 2 : end ) );  
    Setj = length( sets{ 1 } );  
    nRetLen = length( result );  
    ret = cell( 1, Setj * nRetLen );  
      
    for i = 1 : Setj  
        for j = 1 : nRetLen  
            ret{ ( i - 1 ) * nRetLen + j  } = [ sets{ 1 }( i ) result{ j } ];  
        end  
    end  
end  
  
end 