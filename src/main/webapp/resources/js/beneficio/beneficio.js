jQuery(document).on('ready', function () {

    //https://www.w3schools.com/bootstrap/bootstrap_popover.asp
//    $("#select-proveedores").on("change",function(){
//        Cargador.cargarCategoriaProveedor();
//    });
//
//    $("#select-categorias").on("change",function(){
//        Cargador.cargarSubCatById();
//    });
//    $("#select-sub-categorias").on("change",function(){
//        Cargador.cargarBeneficioByIdCat();
//    });

    $(".img-generica").on("click",Beneficio.onImgGenericSelected);
});
var Beneficio = {
    onImgGenericSelected:function(e){
        if($(this).hasClass("selected")){
            $(this).removeClass("selected");
        }
        else{
            $(this).addClass("selected");
        }
    },
    onLoadImagenGenerica:function(){
        
        var idCat = $("#select-categorias").val();
        var idSubCat = $("#select-sub-categorias").val();
        if(idCat!=='-1' && idSubCat!=='-1'){
            $.ajax({
                url: context+'/beneficio/getImgsGenericas.html',
                type: 'GET',
                dataType: 'JSON',
                data: {idCat:idCat,idSubCat:idSubCat},
                success: function (array) {
                    if(array !==undefined && array !== null && array.length > 0){
                        $("#t-img-generica tr").remove();
                        var trs ="";
                        var td ="";
                        for(var i = 0;i < array.length;i++)
                        {
                            
//                            if((i+1)%3 < 3){
//                                td+="<td><img src ='"+array[i]+"' class ='img-50'/></td>";
//                            }
//                            
//                            else{
//                                trs += "<tr>"+td+"</tr>";                                
//                                td = "";
//                            }
                           trs+="<tr><td><img src ='"+array[i]+"' class ='img-50 img-generica'/></td></tr>";
                        }
                        $("#t-img-generica").html(trs);
                        $(".img-generica").on("click",Beneficio.onImgGenericSelected);
                        $('#gallery-imagen-generica').modal('show'); 
                    }
                    else{
                        ModalBennder.mostrar({tipo: "advertencia", mensaje: "Sin imágenes genéricas para cetegoria seleccionada", titulo: "Imágenes"});
                    }
                },
                error: function (x, y, z) {
                    ModalBennder.mostrar({tipo: "error", mensaje: "Error al obtener imaágenes genéricas", titulo: "Cargador"});
                }
            }); 
        }
        else{
            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Favor seleccionar categoría y subcategoria para mostrar imagenes genéricas.", titulo: "Imágenes"});
        }
          
//      var imgSrc = $(a).parent().parent().parent().find("td div img").attr("src");
//        if(imgSrc !== undefined && imgSrc !== ''){
//            $('#imagepreview').attr('src', imgSrc); 
//            $('#imagemodal').modal('show'); 
//        }
//        else{
//            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Aún no ha cargado imagen", titulo: "Cargador"});
//        }


    },
    onValidaGuardaBeneficio:function(){
        //.- guardando
        var inputGenerica ="";
        $(".img-generica.selected").each(function(index){
            var src = $(this).attr("src");
            inputGenerica+="<input name='imagenesGenericas["+index+"].urlImagen' type='hidden' value='"+src+"'/>";
        });
        $(".contents-imagen-generica").append(inputGenerica);
        
        $("#input-idSubCategoriaSelected").val($("#select-sub-categorias").val());
//        ModalLoading.mostrar();
//        $.ajax({
//            url: context+'/beneficio/guardar.html',
//            type: 'POST',
//            dataType: 'JSON',
//            data: $("#form-beneficio").serialize(),
//            success: function (data) {
//                window.location.href = "../home.html";
//                ModalLoading.cerrar();
//            },
//            error: function (x, y, z) {
//                ModalLoading.cerrar();
//                ModalBennder.mostrar({tipo: "error", mensaje: "Problemas al validar usuario", titulo: "Login"});
//            }
//        });
//        $("#form-beneficio").submit(function() {
//
//            var formData = new FormData($(this)[0]);
//
//            $.post($(this).attr("action"), formData, function(data) {
//                window.location.href = "../home.html";
//            });
//
//            return false;
//        });
        
    var fd = new FormData();
    var file_data = $('#form-beneficio input[type="file"]')[0].files; // for multiple files
    for(var i = 0;i<file_data.length;i++){
        fd.append("images["+i+"]", file_data[i]);
    }
    var other_data = $('#form-beneficio').serializeArray();
    $.each(other_data,function(key,input){
        fd.append(input.name,input.value);
    });
    $.ajax({
        url: context+'/beneficio/guardar.html',
        data: fd,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
            window.location.href = "../home.html";
        }
    });
        
        
        //$("#form-beneficio").submit();
    },
    onValidaUploadImagen:function(){
        var idCat=$("#select-categorias").val();
        var idSubCat=$("#select-sub-categorias").val();
        $("#input-idProv").val(idSubCat);
        if(idCat!=='-1' && idSubCat !== '-1'){            
            $("#ipth-id-subcat").val(idSubCat);
            $("#form-img-generica").submit();
            
        }
        else{
            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Favor seleccionar categoría y sub-categoría.", titulo: "Cargador"});
        }
        
    },
    onChangeCategoria:function(){        
        var idCat = $("#select-categorias").val();
        if(idCat!=='-1'){
            $.ajax({
                url: context+'/beneficio/getSubCatById.html',
                type: 'GET',
                dataType: 'JSON',
                data: {idCat:idCat},
                success: function (array) {
                    if(array !==undefined && array !== null){
                        $("#select-sub-categorias option").remove();
                        $("#select-sub-categorias").append("<option value ='-1'>--Seleccione Sub Categoria--</option>");
                        for(var i= 0;i < array.length;i++){
                           var c = array[i];
                           $("#select-sub-categorias").append("<option value ='"+c.idCategoria+"'>"+c.nombre+"</option>");
                        } 
                    }
                },
                error: function (x, y, z) {
                    ModalBennder.mostrar({tipo: "error", mensaje: "Error al cargar subctegorias", titulo: "Categoria Beneficio"});
                }
            }); 
        }
        else{
            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Favor seleccionar categoróa.", titulo: "Categoria Beneficio"});
        }
    },
    previewImage:function(a){
        var imgSrc = $(a).parent().parent().parent().find("td div img").attr("src");
        if(imgSrc !== undefined && imgSrc !== ''){
            $('#imagepreview').attr('src', imgSrc); 
            $('#imagemodal').modal('show'); 
        }
        else{
            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Aún no ha cargado imagen", titulo: "Cargador"});
        }
    },
    saveTempImg:function(input){
        ModalLoading.mostrar();
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $(input).parent().find("img").attr('src', e.target.result);
                //$('#blah').attr('src', e.target.result);
                ModalLoading.cerrar();
            }
            reader.readAsDataURL(input.files[0]);
        }
    },
    onSelectPrincipal:function(index){
       $("#input-indexPrincipal").val(index); 
    },
    uploadImagesBeneficios:function(){
       if($("#select-beneficio").val() === "-1"){
           ModalBennder.mostrar({tipo: "error", mensaje: "Favor seleccionar beneficio", titulo: "Cargador"});
       }
       else{
           //<input type="hidden" name="indexPrincipal" id="input-indexPrincipal"/>
           ModalLoading.mostrar();
           $("#input-idBeneficio").val($("#select-beneficio").val());
           $("#btn-upload-images-submit").click();
       } 
    },
    addFile:function(){
        //var fileIndex = $('#fileTable tr').children().length;
        var fileIndex = $("#fileTable tr").length;
        if(fileIndex !== undefined){
            $('#fileTable').append('<tr><td> '+
                                  '    <div class="input-group">'+
                                  '        <input type="radio" name="optradio" onclick="Cargador.onSelectPrincipal('+ fileIndex +')" > Principal'+
                                  '    </div>'+
                                  '</td>'+
                                  '<td>'+
                                  '    <div class="input-group">'+
                                  '        <input name="files['+ fileIndex +']" type="file" class="form-control" onchange="Cargador.saveTempImg(this);">'+
                                  '        <img src  ="" style="display: none;"/>'+
                                  '    </div>'+
                                  '</td>'+
                                  '<td>'+
                                  '    <div class="input-group">'+
                                  '        <a class="btn btn-primary" onclick="Cargador.previewImage(this);">Preview</a>'+
                                  '    </div>'+
                                  '</td></tr>');
        }
		
    },
    limpiaSelectores:function(){
        $("#select-categorias option").remove();
        $("#select-categorias").append("<option value ='-1'>Seleccione categoria...</option>");        
        $("#select-beneficio option").remove();
        $("#select-beneficio").append("<option value ='-1'>Seleccione beneficio...</option>");
        $("#select-sub-categorias option").remove();
        $("#select-sub-categorias").append("<option value ='-1'>Seleccione sub categoria...</option>");
        
    },
    mostrarUploadImagenes:function(mostrar){
        $("div.images-upload").css("display",mostrar?"block":"none");
        
    },
    cargarCategoriaProveedor:function(){
        var id=$("#select-proveedores").val();
        //<input type="hidden" name="idProv" id="input-idProv"/>
        $("#input-idProv").val(id);
        $.ajax({
            url: context+'/proveedor/obtenerCategoriaByProveedor.html',
            type: 'GET',
            dataType: 'JSON',
            data: {id:id},
            success: function (response) {
                Cargador.limpiaSelectores();
                if(response !==undefined && response !== null){
                    $("#select-categorias option").remove();
                    $("#select-categorias").append("<option value ='-1'>Seleccione categoria...</option>");
                    for(var i= 0;i < response.categorias.length;i++){
                       var c = response.categorias[i];
                       $("#select-categorias").append("<option value ='"+c.idCategoria+"'>"+c.nombre+"</option>");
                    } 
                }
                
            },
            error: function (x, y, z) {
                ModalBennder.mostrar({tipo: "error", mensaje: "Error al cargar categorias", titulo: "Cargador"});
            }
        }); 
    },
    cargarBeneficioByIdCat:function(){
        var id=$("#select-sub-categorias").val();
        $.ajax({
            url: context+'/proveedor/getBeneficiosByIdCat.html',
            type: 'GET',
            dataType: 'JSON',
            data: {id:id},
            success: function (response) {
                if(response !==undefined && response !== null){
                    $("#select-beneficio option").remove();
                    $("#select-beneficio").append("<option value ='-1'>Seleccione beneficio...</option>");
                    Cargador.mostrarUploadImagenes(response.beneficios.length > 0);
                    
                    for(var i= 0;i < response.beneficios.length;i++){
                       var b = response.beneficios[i];
                       $("#select-beneficio").append("<option value ='"+b.idBeneficio+"'>"+b.titulo+"</option>");
                       
                    } 
                }
                else{
                   Cargador.mostrarUploadImagenes(false); 
                }
            },
            error: function (x, y, z) {
                ModalBennder.mostrar({tipo: "error", mensaje: "Error al cargar subctegorias", titulo: "Cargador"});
            }
        }); 
    },
    onChangeSubCategoriaImgGenerica:function(){
        var idCat = $("#select-categorias").val();
        if(idCat!=='-1'){
            $.ajax({
                url: context+'/beneficio/getSubCatById.html',
                type: 'GET',
                dataType: 'JSON',
                data: {idCat:idCat},
                success: function (array) {
                    if(array !==undefined && array !== null){
                        $("#select-sub-categorias option").remove();
                        $("#select-sub-categorias").append("<option value ='-1'>--Seleccione Sub Categoria--</option>");
                        for(var i= 0;i < array.length;i++){
                           var c = array[i];
                           $("#select-sub-categorias").append("<option value ='"+c.idCategoria+"'>"+c.nombre+"</option>");
                        } 
                    }
                },
                error: function (x, y, z) {
                    ModalBennder.mostrar({tipo: "error", mensaje: "Error al cargar subctegorias", titulo: "Cargador"});
                }
            }); 
        }
        else{
            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Favor seleccionar categoróa.", titulo: "Cargador"});
        }
    }
};



