package cl.praxis.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cl.praxis.model.conexion.Conexion;
import cl.praxis.model.dto.Proveedores;

public class ProveedoresDAO {
	
	public void crear(Proveedores p) {
	
		String querySql = "INSERT INTO proveedores	(nombre, rut, direccion, correo, telefono, contacto, telefono_contacto) VALUES 	('"+ p.getNombre() + "', '" + p.getRut() +"', '" + p.getDireccion() + "', '" + p.getCorreo() + "', '" + p.getTelefono() + "', '" + p.getContacto() + "', '" + p.getTelefonoContacto() + "')";
		
		System.out.println(querySql);
		
		try {
			Connection con = Conexion.getConn();
			Statement st = con.createStatement();
			st.execute(querySql);
			
			
		}catch (SQLException e) {
			System.out.println("Error en metodo Crear()");
			e.printStackTrace();
			
		}
		
		
	}
	
	
	public List<Proveedores> read(){
		
		List<Proveedores> proveedores = new ArrayList<Proveedores>();
		try {
			Connection conectar = Conexion.getConn();
			Statement s = conectar.createStatement();
			
			String querySql = "Select id, nombre, rut, direccion, correo, telefono, contacto, telefono_contacto from proveedores";
			
			
			ResultSet rs = s.executeQuery(querySql);
			
			
			while (rs.next()) {				
			proveedores.add(new Proveedores(rs.getInt("id"), rs.getString("nombre"), rs.getString("rut"), rs.getString("direccion"), rs.getString("correo"), rs.getInt("telefono"), rs.getString("contacto"), rs.getInt("telefono_contacto")));
			}				
			
		}catch(SQLException ex){
			System.out.println("Error en el Metodo read()");
			ex.printStackTrace();
		}
		
		return proveedores;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
