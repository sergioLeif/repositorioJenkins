package proyectoJenkins.pruebaGitHub;

import junit.framework.TestCase;

public class testeo extends TestCase {
	App cuentaA;
	App cuentaB;
	
	protected void setUp() {
	cuentaA=new App(500, 0);
	cuentaB=new App(20, 10);
	}
	
	public void testSimpleAdd() { 
//		Assert.assertTrue(cuentaB.ingresar(10));
		cuentaB.ingresar(5);
		cuentaB.ingresar(13);
	}
	
	
}
