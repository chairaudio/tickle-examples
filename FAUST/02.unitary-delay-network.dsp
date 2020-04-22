chair = library("chair.lib");

de = library("delays.lib");
fi = library("filters.lib");
no = library("noises.lib");
ma = library("maths.lib");

//prociss = 
//	chair.dc_offset <:
//  (
//		(((chair.x,_) : (2 * ma.PI * (cos)),( + : de.delay(ma.SR/5, 5) * 0.999) :  * )  ~ _ ),
//		(((chair.x,_) : (2 * ma.PI * (sin)),( + : de.delay(ma.SR/5, 5) * 0.999) :  * )  ~ _ )
//  ) : + ;

g(x) =
	(x, _, x, _, x, _, x,_) : (*,*,*,*);
mx(psi,damp) = 
	(cos(psi),_, sin(psi) * (-1),_, sin(psi),_, cos(psi),_) : (*,*,*,*) : g(damp);

process = 
//	chair.dc_offset <: ;
	((_,chair.x,_) : (+,+) : (_,_) <: mx(0.5,0.99) : (+,+)) ~ 
	(de.delay(ma.SR/5, 5*ma.SR/1000),de.delay(ma.SR/5, 5*ma.SR/1000)) ;
