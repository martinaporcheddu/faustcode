import("stdfaust.lib"); 
// process = _ * 0.5; // *1 = 0dB | *0.5 = -6dB | *0.25 = -12dB | *0.125 = -18dB ...
                   // *2 = +6dB | *1.5 = +3dB
fader = vslider("volume", 0, 0, 1, 0.01) ;
process = _ * fader ;
