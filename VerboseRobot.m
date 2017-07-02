classdef VerboseRobot < RobotInterface
    methods (Static)
        function res = buildLogSpec(type)
            str1 = 'Setting servo %i to ';
            str2 = ' %i';
            res = strcat(str1, type, str2);
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
        end
        
        function setTarget(obj, servo, target)
            formatSpec = VerboseRobot.buildLogSpec('target');
            proc = @() fprintf(formatSpec, servo, target);
            obj.onVerbose(proc);
        end
        
        function setAccel(obj, servo, target)
            formatSpec = VerboseRobot.buildLogSpec('acceleration');
            proc = @() fprintf(formatSpec, servo, target);
            obj.onVerbose(proc);
        end
        
        function setSpeed(obj, servo, target)
            formatSpec = VerboseRobot.buildLogSpec('speed');
            proc = @() fprintf(formatSpec, servo, target);
            obj.onVerbose(proc);
        end
        
        function goHome(obj, ~, ~)
            proc = @() disp('Setting all servos to home position');
            obj.onVerbose(proc);
        end
    end
end
