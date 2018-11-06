package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ExameDAO;
import dao.ExameDAOImpl;
import dao.GenericDAOException;
import entidade.Exame;

@WebServlet("/ExameController")
public class ExameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmdE");
		String msgE = null;
		HttpSession session = request.getSession();
		try {
			ExameDAO eDao = new ExameDAOImpl();
			if ("adicionar".equals(cmd)){
				Exame e = new Exame();
				e.setExame(request.getParameter("nomeExame"));
				eDao.adicionaExame(e);
				msgE = "Cadastro adicionado com sucesso";
			} else if ("pesquisar".equals(cmd)) {
				List<Exame> listaE = eDao.pesquisarExame(request.getParameter("nomeExame"));
				session.setAttribute("LISTA", listaE);
				msgE = "Foi encontrado " + listaE.size() + " cadastro";
			}
		} catch (GenericDAOException e) {
			e.printStackTrace();
			msgE = "Erro ao adicionar este cadastro";
		}
		
		session.setAttribute("MENSAGEM", msgE);
		response.sendRedirect("./administracao.jsp");
		
	}

}
