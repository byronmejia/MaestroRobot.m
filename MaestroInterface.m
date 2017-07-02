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
    end
    
    methods (Abstract)
        setTarget(obj, servo, target)
        setAccel(obj, servo, accel)
        setSpeed(obj, servo, speed)
    end
    
    methods (Sealed)
        function onVerbose(obj, proc)
            if (obj.Verbose)
                proc();
            end
        end
    end
end
