classdef MaestroInterface < handle
    % RobotInterface An interface that defines how Robots should be
    % manipulated.
    %   RobotInterface sets the standards on how Maestro devices
    %   should be interfaced in MATLAB. This interface is originally
    %   designed for a Micro Maestro but should, in theory, work with an
    %   infinitely sized servo controller (0..inf). I don't know how true
    %   that is though, so assume 6 servos for sanity sake.
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
        
        function setDegreeMinMax(obj, min, max)
            assert(isnumeric(min));
            assert(isnumeric(max));
            obj.DegreeMin = min;
            obj.DegreeMax = max;
        end
        
        function setServoMinMax(obj, min, max)
            assert(isnumeric(min));
            assert(isnumeric(max));
            obj.ServoMin = min;
            obj.ServoMax = max;
        end
    end
end