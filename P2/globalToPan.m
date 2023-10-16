function pointPanCoord = globalToPan(globalCoord, pointGlobalCoord, sinArray, cosArray)

%this function transform a point in the global coordinate system into the
%panel coordinate system

pointPanCoord(1) = (pointGlobalCoord(1) - globalCoord(1)) * cosArray - (pointGlobalCoord(2) - globalCoord(2)) * sinArray;
pointPanCoord(2) = (pointGlobalCoord(1) - globalCoord(1)) * sinArray + (pointGlobalCoord(2) - globalCoord(2)) * cosArray;
