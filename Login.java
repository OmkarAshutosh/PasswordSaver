
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	Connection con;
	Statement smt;
	ResultSet rs;
	public void init(){
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","omkar");
		smt=con.createStatement();
		
				
	}catch(Exception e ) {
		System.out.println(e);
	}	
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long mob = Long.parseLong(request.getParameter("ph"));
		String pass = request.getParameter("pass");
		String qry="select * from PS_user where mob="+mob+" and pass='"+pass+"'";
		
		
		try {
		rs=smt.executeQuery(qry);
		
			PrintWriter o=response.getWriter();
//			o.print(qry);
			o.print("<html><body>");
				
				if(rs.next()) {	
						HttpSession session=request.getSession(true);
						request.getSession(true);
						session.setAttribute("number", mob);
						response.sendRedirect("welcome");
				}else {
					o.print("<script type=\"text/javascript\">alert('Incorrect Credentials'); ");
					o.print("location='/PasswordSaver/login.jsp';");
					o.print("</script>");
					
				}
			
			o.print("</body></html>");
		}catch(Exception ee) {
			ee.printStackTrace();
		}
	}
	public void destroy() {
		try {
			rs.close();
			smt.close();
			con.close();
			
		}catch(Exception eee) {
			eee.printStackTrace();
		}
	}



}


