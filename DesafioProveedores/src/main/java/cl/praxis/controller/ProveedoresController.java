package cl.praxis.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.praxis.model.dao.ProveedoresDAO;
import cl.praxis.model.dto.Proveedores;

 
@WebServlet("/Proveedores")
public class ProveedoresController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProveedoresController() {
        super();
     }
 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		ProveedoresDAO pDAO  = new ProveedoresDAO() ;
		
		List<Proveedores> proveedores = pDAO.read();
		
		
		//forma1 		
 		//actores.stream().forEach(System.out::println);
 		
 		//forma2
 		//actores.forEach( a -> { 
 			//					System.out.println(a); 
 				//				} );
 		//forma3
 		//System.out.println(proveedores.get(0).toString());
 			
		
		request.setAttribute("proveedores", proveedores);
		
		getServletContext().getRequestDispatcher("/views/Proveedores.jsp").forward(request, response);
		
		
		
		
 	}

	 
	
	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
