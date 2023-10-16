function pointGlobalCoord = panToGlobal(globalCoord, pointPanCoord, sinArray, cosArray)

%this function transform a point in the pabel coordinate system into the
%global coordinate system

pointGlobalCoord(1) = globalCoord(1) + pointPanCoord(1) * cosArray + pointPanCoord(2) * sinArray;
pointGlobalCoord(2) = globalCoord(1) + pointPanCoord(1) * cosArray + pointPanCoord(2) * sinArray;
