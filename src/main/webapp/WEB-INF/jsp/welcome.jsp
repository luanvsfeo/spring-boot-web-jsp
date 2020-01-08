<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="pt">
    <head>
        <title>Controle de Cartorios</title>
        <link rel="stylesheet" type="text/css"href="webjars/bootstrap/4.4.1/css/bootstrap.min.css" />
        <c:url value="/css/main.css" var="jstlCss" />
        <c:url value="/js/script.js" var="jstlJs" />
        <c:url value="/js/jquery-3.4.1.js" var="jstlJquery" />
        <link href="${jstlCss}" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <header>   

        </header>

        <div class="container">
            <nav class="navbar navbar-light bg-light justify-content-between">
                <a class="navbar-brand">Tabela de Cartorios</a>
                <form class="form-inline">
                    <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#modal-cadastro">Novo</button>
                    <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#modal-pesquisar">Pesquisar</button>
                    <button type="button" class="btn btn-primary btn-listar" > Listar</button>
                </form>
            </nav>


            <table class="tabela table table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>

        </div>

        <!-- Modal Cadastro-->
        <div class="modal fade" id="modal-cadastro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Cadastro de cartorio</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="text" placeholder="nome do cartorio" class="form-control" id="inputNome" >
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="button" class="btn btn-primary  btn-cadastrar">Cadastrar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Pesquisar-->
        <div class="modal fade" id="modal-pesquisar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Pesquisar de cartorio</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="text" placeholder="codigo do cartorio" class="form-control" id="inputId" >
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="button" class="btn btn-primary  btn-pesquisar">Pesquisar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Atualizar/Editar-->
        <div class="modal fade" id="modal-atualizar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Atualização de cartorio</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="text" placeholder="nome do cartorio" class="form-control inputNomeAtualizar" >
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="button" class="btn btn-primary  btn-atualizar">Atualizar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- .container -->
        <script type="text/javascript" src="${jstlJquery}"></script>
        <script type="text/javascript" src="webjars/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${jstlJs}"></script>

    </body>

</html>
