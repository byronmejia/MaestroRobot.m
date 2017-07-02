classdef RobotInterface < handle
  properties (SetAccess = protected, GetAccess = protected)
    Port
    ServoMin
    ServoMax
    DegreeMin
    DegreeMax
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
  end
end

