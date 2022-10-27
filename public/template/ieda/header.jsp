<!-- Page header -->
<div class="page-header">
    <div class="breadcrumb-line breadcrumb-line-wide">

        <%
            String nmEscola = "";

            if (session.getAttribute("nmEscola") != null) {
                nmEscola = session.getAttribute("nmEscola").toString();
            }
        %>

        <ul class="breadcrumb">
            <li><a href="#"><i class="icon-home2 position-left"></i> <%=nmEscola%></a></li>
        </ul>
    </div>

    <div class="page-header-content">
        <div class="page-title">
        </div>

        <div class="heading-elements">
            <div class="heading-btn-group">
                <form method="post" action="VXN1YXJpb1NlcnZsZXQjRENJ?YWNjYW8jZG9VcGRhdGU=">
                    <button type="submit" onclick="this.disabled = 'disabled'; this.form.submit();" class="btn btn-labeled btn-labeled-left bg-danger-400 heading-btn text-bold text-uppercase">Voltar ao painel principal<b><i class="icon-chevron-left"></i></b></button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /page header -->
<!-- Page container -->
<div class="page-container">

    <!-- Page content -->
    <div class="page-content">