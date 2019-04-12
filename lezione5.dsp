import("stdfaust.lib"); 
// vmeter = indicatore di livello 
// attach = (attach ha un'entrata e un'uscita) invia la variabile x a envelop e alla sua uscita
// vbargraph = è un oggetto grafico, un indicatore verticale luminoso | unit:db = indica la scala in dB 
// envelop = rilevatore di ampiezza. E' l'oggetto che rileva l'ampiezza del segnale per inviarlo a vmeter 
// ba.db2linear = converte da valori logaritmici a valori lineari 
// 80.0/ma.SR = SR,sample rate | 80.0 intervallo di misurazione (ogni 80 millisecondi aggiorna la barra di misurazione)
envelop = abs : max(ba.db2linear(-70)) : ba.linear2db : min(10) : max ~ -(80.0/ma.SR);	
vmeter(x) = attach(x, envelop(x) : vbargraph("[unit:dB]" , -70, 0)); 
			 		  
panpot = vslider("panpot [style:knob]", 0.5, 0, 1, 0.01);
volume = vslider("volume", 0, 0, 1, 0.01);
process = _ <: vgroup("[1]", _*(1-panpot), _*(panpot)) : vgroup("[2]", hgroup("", vgroup("[1]", _*volume , _*volume) : vgroup("[2]", hgroup("", vmeter, vmeter))));
