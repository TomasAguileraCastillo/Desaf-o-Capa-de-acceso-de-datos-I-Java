package cl.praxis.model.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	//Conexion Singleton
	
	private static Connection conn = null;

	private String driver = "org.postgresql.Driver" ;
	private String dataBase = "empresa_distribucionDB";
	private String url = "jdbc:postgresql://localhost:5433/" + dataBase ;
	private String user = "postgres";
	private String pass = "admin";
	
	
	//Constructor
	public Conexion() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pass);
			boolean isValid = conn.isValid(50000);
			System.out.println(isValid ? "Tests ok BD Postgres":"Test no ok BD Postgre");			
		}catch (ClassNotFoundException | SQLException ex ) {
			System.out.println("Error al Conectar con la BD : " + ex.getMessage());
		}
	}
	
	
	
	public static Connection getConn() {
		if (conn == null) {
			new Conexion();
		}
		return conn;
	}
	
	
	

}
