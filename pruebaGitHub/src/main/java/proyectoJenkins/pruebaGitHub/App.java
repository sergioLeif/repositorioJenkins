package proyectoJenkins.pruebaGitHub;

public class App{
	private int maxIngreso;
	private int dinero;
	
	public App (String nombre, int maxIngreso, int dinero){
		this.maxIngreso=maxIngreso;
		this.dinero=dinero;
	}
	
	public boolean ingresar(int ingreso){
		boolean confirmacion=false;
		if ((ingreso>0)&&(ingreso<maxIngreso)){
			dinero+=ingreso;
			confirmacion=true;
		}
		return confirmacion;
	}
	
}