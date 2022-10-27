$(document).ready(function() {
    console.log("Aqui select js");
    $.ajax({
        url: "CommonServelet",
        method: "GET",
        data: { operation: 'getCursos' },
        success: function(data) {
            console.log(data);
            $("#idCurso option").remove();
            $("#idCurso").append('<option value="">Seleciona uma classe </option>');
            var obj = $.parseJSON(data);
            $.each(obj, function(key, value) {
                $("#idCurso").append('<option value="' + value.cursId + '">' + value.cursDescricao + '</option>');
            });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("Error: " + jqXHR.toString());
        }
    });

    $.ajax({
        url: "CommonServelet",
        method: "GET",
        data: { operation: 'getSalas' },
        success: function(data) {
            console.log(data);
            $("#idSala option").remove();
            var obj = $.parseJSON(data);
            $.each(obj, function(key, value) {
                $("#idSala").append('<option value="' + value.salaId + '">' + value.salaDescricao + '</option>');
            });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("Error: " + jqXHR.toString());
        }
    });

    $.ajax({
        url: "CommonServelet",
        method: "GET",
        data: { operation: 'getDocentes' },
        success: function(data) {
            console.log(data);
            $("#idDocente1 option").remove();
            $("#idDocente2 option").remove();
            var obj = $.parseJSON(data);
            $.each(obj, function(key, value) {
                $("#idDocente1").append('<option value="' + value.doceId + '">' + value.pessoa.pessNome + ' ' + value.pessoa.pessApelido + '</option>');

                $("#idDocente2").append('<option value="' + value.doceId + '">' + value.pessoa.pessNome + ' ' + value.pessoa.pessApelido + '</option>');
            });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("Error: " + jqXHR.toString());
        }
    });

    $(document).on('change', '#idCurso', function(e) {

        e.preventDefault();
        $("#curso").html($("#idCurso").val());
        $.ajax({
            url: "CommonServelet",
            method: "GET",
            data: { operation: 'getDisciplinaCurso', cursoId: $("#idCurso").val() },
            success: function(data) {
                console.log(data);
                $("#idDisciplina option").remove();
                $("#idDisciplina").append('<option value=""> Seleciona uma disciplina </option>');
                var obj = $.parseJSON(data);
                $.each(obj, function(key, value) {
                    $("#idDisciplina").append('<option value="' + value.discId + '">' + value.discDescricao + '</option>');
                });
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Error: " + jqXHR.toString());
            }
        });

        $.ajax({
            url: "CommonServelet",
            method: "GET",
            data: { operation: 'getSalaExamesCurso', cursoId: $("#idCurso").val() },
            success: function(data) {
                console.log(data);
                //  $("#idDisciplina option").remove();
                //   $("#idDisciplina").append('<option value=""> Seleciona uma disciplina </option>');
                var obj = $.parseJSON(data);

                var table = $('#tableSalaExames');
                $.each(obj, function(key, value) {
                    table.find('#body').append('<tr> <td> dis</td><td><%=sa%> </td>  <td>  <%=d1%>  </td>  <td>  <%=num%>  </td>   <td> <%=j1%>  </td> <td>   <%=j2%>  </td>  </tr>');


                });
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Error: " + jqXHR.toString());
            }
        });
    });
});