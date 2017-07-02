classdef VerboseRobot < RobotInterface
    methods (Static)
        function res = buildLogSpec(type)
            str1 = 'Setting servo %i to';
            str2 = ' %i';
            res = strcat(str1, ' ', type, str2);
        end
    end
    methods
        function gobj = VerboseRobot(verbose)
            if nargin > 0
                assert(islogical(verbose));
                gobj.Verbose = verbose;
            else
                gobj.Verbose = false;
            end
            
            gobj.setDegreeMinMax(20, 160);
            gobj.setServoMinMax(3000, 9000);
        end
        
        function setTarget(obj, servo, target)
            assert(isnumeric(servo), "servo argument is not a numeric");
            assert(isnumeric(target), "target argument is not a numeric");
            formatSpec = VerboseRobot.buildLogSpec('target');
            proc = @() fprintf(formatSpec, servo, target);
            obj.onVerbose(proc);
        end
        
        function setAccel(obj, servo, target)
            assert(isnumeric(servo), "servo argument is not a numeric");
            assert(isnumeric(target), "target argument is not a numeric");
            formatSpec = VerboseRobot.buildLogSpec('acceleration');
            proc = @() fprintf(formatSpec, servo, target);
            obj.onVerbose(proc);
        end
        
        function setSpeed(obj, servo, target)
            assert(isnumeric(servo), "servo argument is not a numeric");
            assert(isnumeric(target), "target argument is not a numeric");
            formatSpec = VerboseRobot.buildLogSpec('speed');
            proc = @() fprintf(formatSpec, servo, target);
            obj.onVerbose(proc);
        end
        
        function goHome(obj)
            proc = @() disp('Setting all servos to home position');
            obj.onVerbose(proc);
        end
    end
end
