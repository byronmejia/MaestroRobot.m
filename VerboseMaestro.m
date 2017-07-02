classdef VerboseMaestro < MaestroInterface
    methods (Static)
        function res = buildLogSpec(type)
            str1 = 'Setting servo %i to:\t';
            str2 = ' %i\n';
            res = strcat(str1, type, str2);
        end
    end
    methods
        function gobj = VerboseMaestro(verbose)
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
            formatSpec = VerboseMaestro.buildLogSpec('target');
            proc = @() fprintf(formatSpec, servo, target);
            obj.onVerbose(proc);
        end
        
        function setAccel(obj, servo, target)
            assert(isnumeric(servo), "servo argument is not a numeric");
            assert(isnumeric(target), "target argument is not a numeric");
            formatSpec = VerboseMaestro.buildLogSpec('acceleration');
            proc = @() fprintf(formatSpec, servo, target);
            obj.onVerbose(proc);
        end
        
        function setSpeed(obj, servo, target)
            assert(isnumeric(servo), "servo argument is not a numeric");
            assert(isnumeric(target), "target argument is not a numeric");
            formatSpec = VerboseMaestro.buildLogSpec('speed');
            proc = @() fprintf(formatSpec, servo, target);
            obj.onVerbose(proc);
        end
        
        function goHome(obj)
            proc = @() disp('Setting all servos to home position');
            obj.onVerbose(proc);
        end
    end
end
