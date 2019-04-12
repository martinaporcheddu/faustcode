import("stdfaust.lib"); 

panpot = hslider("panpot", 0, 0, 1, 0.01) ;
volume = vslider("volume", 0, 0, 1, 0.01) ;
process = _ <: _* (1-panpot), _*(panpot) : _*volume , _*volume ;
