<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="entidade.Cadastro, entidade.Usuario, java.util.List, java.util.ArrayList, java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registro de Liga��o</title>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.mask.min.js"/></script>
	<link rel="stylesheet" href="./css/bootstrap.css" />
	
	<script>
		function remover( id ) {
			if (confirm("Remove o cadastro com id " + id)) {
				$('#cadastroform').empty();
				$('#cadastroform').append('<input type="hidden" name="id" value="' + id + '"/>');
				$('#cadastroform').append('<input type="hidden" name="cmd" value="remover"/>');
				$('#cadastroform').submit();
			}
		}

		function editar( id ) {
			$('#cadastroform').empty();
			$('#cadastroform').append('<input type="hidden" name="id" value="' + id + '"/>');
			$('#cadastroform').append('<input type="hidden" name="cmd" value="editar"/>');
			$('#cadastroform').submit();
		}
	</script>
	
</head>
<body>
<%@ include file="./menu.jsp" %>
	<br><br>
	
	<section>
		<h1>IPGG - Registro de liga��es</h1>
	</section>
	
	<%  Date dia = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	
		Date hora = new Date();
		SimpleDateFormat sdfh = new SimpleDateFormat("HH:mm");
	
		String msg = (String)session.getAttribute("MENSAGEM");
	
		Usuario user = (Usuario)session.getAttribute("LOGADO");
	
	   List<Cadastro> lista = (List<Cadastro>)session.getAttribute("LISTA");
	   if (lista == null){
		   lista = new ArrayList<Cadastro>();
	   } else {
		   session.setAttribute("LISTA", null);
	   }
	   
	   Cadastro cadastroAtual = (Cadastro)session.getAttribute("CADASTRO_ATUAL");
	   if (cadastroAtual == null) { 
		   cadastroAtual = new Cadastro();
	   } else { 
		   session.setAttribute("CADASTRO_ATUAL", null);
	   }
	   
	   if (msg != null) {
		   session.setAttribute("MENSAGEM", null);
	%>
			<h3 class="alert alert-danger"><%=msg%></h3>
	<% } %>
	<br><br>

	<form action="./CadastroController" method="post" class="form-inline" id="cadastroform">
	  	
	  	<input type type="text" name="id" id="id" value="<%=cadastroAtual.getId()%>" hidden> 
	  	
		<label for="textfield" class="margemR">Usu�rio:</label>
		<input type="text" class="margemB" name="usuario" id="usuario" value="<%= user.getNome()%>" readonly>
        
        <label for="textfield" class="margemR">Data:</label>
		<input class="margemB" name="data" id="data" value="<%= sdf.format(dia) %>" readonly>
        
        <label for="time" class="margemR">Hora:</label>
      	<input class="margemB" name="hora" id="hora" value="<%= sdfh.format(hora)%>" readonly>
                
        <label for="select" class="margemR">Setor:</label>
  		<select name="setor" class="margemB" name="setor" id="setor">
        	<option selected>Escolha o setor</option>
            <option>Inform�tica</option>
            <option>NES</option>
            <option>SAME</option>
  		</select>
        
        <br><br><br>
        
        	
            <label for="textfield" class="margemR">C�digo:</label>
            <input type="text" class="margemB" name="codigo" id="codigo" value="<%=cadastroAtual.getCodigo()%>" >
            <button type="submit" class="btn btn-primary btn-lg" name="cmd" value="pesquisarC">
            	<span class="glyphicon glyphicon-search"></span>
            </button>
            
            <label for="textfield" class="margemR">Prontu�rio:</label>
            <input type="text" class="margemB" name="prontuario" id="prontuario" value="<%=cadastroAtual.getProntuario()%>" >
            <button type="submit" class="btn btn-primary btn-lg" name="cmd" value="pesquisarP">
            	<span class="glyphicon glyphicon-search"></span>
            </button>
            
        <br>
        
        <label for="textfield" class="margemR">Paciente:</label>
		<input type="text" class="margemB" name="paciente" id="paciente" value="<%=cadastroAtual.getPaciente()%>" >
        
        <br>
        
  		<select class="selectMenu" name="consulta" id="consulta">
  			<option selected>Selecione a consulta ou exame</option>
            <option >Geriatria</option>
        </select>
        
		<input type="text" name="externo" id="externo" value="<%=cadastroAtual.getExterno()%>" placeholder="Especificar consulta ou exame externo">
        
        <br>
        
        <select class="selectMenu" name="profissional" id="profissional">
  			<option selected>Selecione o nome do profissional</option>
            <option>Dr. Drauzio varella</option>
            <option></option>
        </select>
        
        <select class="selectMenu" name="motivo" id="motivo">
  			<option selected>Selecione o motivo da liga��o</option>
            <option>Altera��o data da consulta</option>
            <option></option>
        </select>
        
        <br>
        
        <label for="telefone1" class="margemR">Telefone:</label>
  		<input type="tel" class="margemB" name="telefone1" id="telefone1" value="<%=cadastroAtual.getTelefone1()%>" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4,5}" placeholder="(00) 0000-0000">
        <script type="text/javascript">$("#telefone1").mask("(00) 0000-00009");</script>
        
        <label for="textfield" class="margemR">Contato:</label>
		<input type="text" class="margemB" name="contato1" id="contato1" value="<%=cadastroAtual.getContato1()%>">
        
        <select class="margemR" name="situacao1" id="situacao1">
        	<option selected>Situa��o</option>
            <option>Informado</option>
            <option>N�o atende</option>
  		</select>
        
        <br>
        
        <label for="tel" class="margemR">Telefone:</label>
  		<input type="tel" class="margemB" name="telefone2" id="telefone2" value="<%=cadastroAtual.getTelefone2()%>" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4,5}" placeholder="(00) 0000-0000">
        <script type="text/javascript">$("#telefone2").mask("(00) 0000-00009");</script>
        
        <label for="textfield" class="margemR">Contato:</label>
		<input type="text" class="margemB" name="contato2" id="contato2" value="<%=cadastroAtual.getContato1()%>">
        
        <select class="margemR" name="situacao2" id="situacao2">
  			<option selected>Situa��o</option>
            <option>Informado</option>
            <option>N�o atende</option>
        </select>
        
        <br>
        
        <label for="tel" class="margemR">Telefone:</label>
  		<input type="tel" class="margemB" name="telefone3" id="telefone3" value="<%=cadastroAtual.getTelefone3()%>" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4,5}" placeholder="(00) 0000-0000">
        <script type="text/javascript">$("#telefone3").mask("(00) 0000-00009");</script>
        
        <label for="textfield" class="margemR">Contato:</label>
		<input type="text" class="margemB" name="contato3" id="contato3" value="<%=cadastroAtual.getContato3()%>">
        
        <select class="margemR" name="situacao3" id="situacao3">
  			<option selected>Situa��o</option>
            <option>Informado</option>
            <option>N�o atende</option>
        </select>
        
        <br>
        
        <label for="tel" class="margemR">Telefone:</label>
  		<input type="tel" class="margemB" name="telefone4" id="telefone4" value="<%=cadastroAtual.getTelefone4()%>" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4,5}" placeholder="(00) 0000-0000">
        <script type="text/javascript">$("#telefone4").mask("(00) 0000-00009");</script>
        
        <label for="textfield" class="margemR">Contato:</label>
		<input type="text" class="margemB" name="contato4" id="contato4" value="<%=cadastroAtual.getContato4()%>">
        
        <select class="margemR" name="situacao4" id="situacao4">
  			<option selected>Situa��o</option>
            <option>Informado</option>
            <option>N�o atende</option>
        </select>
        
        <br>
        
        <label for="textfield" class="margemR">Observa��es:</label>
		<input type="text" name="obser" id="obser" value="<%=cadastroAtual.getObser()%>">
        
        <br><br>
        
        <div class="form-group">
				<%if (cadastroAtual.getId() == 0) { %>
					<button class="btn btn-primary" type="submit" value="adicionar" name="cmd" id="btnEnviar">Adicionar</button>
				<%} else { %>
					<button type="submit" class="btn btn-primary" name="cmd" value="salvar">Salvar</button>
				<%} %>
		</div>	
        
        <%if (lista.size() > 0) {%>
        <div class="container">
        	<table class="table table-striped">
        		<thead>
					<tr>
						<th>Id</th>
						<th>Data</th>
						<th>Hora</th>
						<th>Setor</th>
						<th>C�digo</th>
						<th>Prontu�rio</th>
						<th>Paciente</th>						
					</tr>
				</thead>
        	
        		<tbody>
        			<% for (Cadastro c : lista) { %>
        			<tr>
        				<td><%=c.getId() %></td>
        				<td><%=c.getData() %></td>
        				<td><%=c.getHora() %></td>
        				<td><%=c.getSetor() %></td>
        				<td><%=c.getCodigo() %></td>
        				<td><%=c.getProntuario() %></td>
        				<td><%=c.getPaciente() %></td>
        				<td>
							<div class="form-group">
								<button type="button" class="btn btn-primary" onclick="remover('<%=c.getId()%>');">Remover</button>
								<button type="button" class="btn btn-primary" onclick="editar('<%=c.getId()%>');">Editar</button>								
							</div>																		
						</td>
        			</tr>
        			<% } %>
        		</tbody>
        	</table>
        </div>
    	<%} %>
    </form>
    
    <script>
    	var consulta = "<%=cadastroAtual.getConsulta()%>";
		if (consulta != "null") {
			$('#consulta').val( consulta );
		}
		
		var setor = "<%=cadastroAtual.getSetor()%>";
		if (setor != "null") {
			$('#setor').val( setor );
		}
		
		var profissional = "<%=cadastroAtual.getProfissional()%>";
		if (profissional != "null") {
			$('#profissional').val( profissional );
		}
		
		var motivo = "<%=cadastroAtual.getMotivo()%>";
		if (motivo != "null") {
			$('#motivo').val( motivo );
		}
		
		var sit1 = "<%=cadastroAtual.getSituacao1()%>";
		if (sit1 != "null") {
			$('#situacao1').val( sit1 );
		}
		
		var sit2 = "<%=cadastroAtual.getSituacao2()%>";
		if (sit2 != "null") {
			$('#situacao2').val( sit2 );
		}
		
		var sit3 = "<%=cadastroAtual.getSituacao3()%>";
		if (sit3 != "null") {
			$('#situacao3').val( sit3 );
		}
		
		var sit4 = "<%=cadastroAtual.getSituacao4()%>";
		if (sit4 != "null") {
			$('#situacao4').val( sit4 );
		}
</script>

</body>
</html>
