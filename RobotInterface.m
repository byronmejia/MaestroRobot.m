classdef RobotInterface < handle
    properties (SetAccess = protected, GetAccess = protected)
        Verbose
        Port
        ServoMin
        ServoMax
        DegreeMin
        DegreeMax
        ServoCount
    end
    
    methods (Abstract)
        setTarget(obj, servo, target)
        setAccel(obj, servo, accel)
        setSpeed(obj, servo, speed)
        goHome(obj)
    end
    
    methods (Static)
        function out = mapMinMax(x, inMin, inMax, outMin, outMax)
            out = (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMax;
        end
    end
    
    methods
        function out = map(obj, degree)
            out = RobotInterface.mapMinMax(degree, obj.DegreeMin, obj.DegreeMax, obj.ServoMin, obj.ServoMax);
        end
        
        function onVerbose(obj, proc)
            if (obj.Verbose)
                proc();
            end
        end
    end
end