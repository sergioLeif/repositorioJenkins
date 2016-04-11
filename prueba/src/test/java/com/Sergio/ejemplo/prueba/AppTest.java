package com.Sergio.ejemplo.prueba;

import junit.framework.TestCase;

public class AppTest extends TestCase {
	App cuentaA;
	App cuentaB;
	
	protected void setUp() {
	cuentaA=new App("Miguel", 500, 0);
	cuentaB=new App("Hector",20, 0);
	}
	
	public void testSimpleAdd() { 
//		Assert.assertTrue(cuentaB.ingresar(10));
		cuentaB.ingresar(13);
	}
	
	
}

