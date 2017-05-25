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
    $("#f-adjuntar").on("change",Beneficio.onSeleccionImagenPrivadas);
    $(".icon-delete-img").on("click",VisualizadorImg.onDeleteImage);
    $("#add-condicion").keypress(Beneficio.onKeyEnterCondicion);
    $("#add-condicion").keypress(Beneficio.onKeyEnterAdicional);
    
    
    
    
});

var VisualizadorImg = {
    init:function(w,h){
        this.dimension.w =w;
        this.dimension.h =h;
    },
    filesUp:0,
    imgNoVal:[],
    dimension:{w:700,h:420},
    getImgExample:function(){
        return $("#rutaImagenExample").val();
    },
    onDeleteImage:function(){
        $iconDelte = $(this);
        $iconDelte.parent().find("img").attr("src",VisualizadorImg.getImgExample());
        $iconDelte.parent().find("span.t-image").text("");
        $iconDelte.parent().find("a.thumbnail").removeClass("load");
        $iconDelte.parent().find(".button-checkbox").css("display","none");
        
        //$iconDelte.remove();
        VisualizadorImg.reordenarImagen();
    },
    validaDimensionImg:function(file,N){
	
        /*var $img = $("#myImage");
        console.log(
                $img.prop("naturalWidth") +'\n'+  // Width  (Natural)
                $img.prop("naturalHeight") +'\n'+ // Height (Natural)
                $img.prop("width") +'\n'+         // Width  (Rendered)
                $img.prop("height") +'\n'+        // Height (Rendered)
                $img.prop("x") +'\n'+             // X offset
                $img.prop("y")                    // Y offset ... 
        );*/


        var img = new Image();
        img.src = window.URL.createObjectURL( file );
        var width,height;
        img.onload = function() {
        width = img.naturalWidth;
        height = img.naturalHeight;
            window.URL.revokeObjectURL( img.src );
            VisualizadorImg.filesUp++;
            if( width > VisualizadorImg.dimension.w || height > VisualizadorImg.dimension.h ) {
                VisualizadorImg.imgNoVal.push(file.name);
            }
            else{
                VisualizadorImg.addImgValida(file.name);
     
            }
            if(VisualizadorImg.filesUp === N){
                VisualizadorImg.validarImagenFueraRango();
            }
        };
    },
    validarImagenFueraRango:function(){
        if(VisualizadorImg.imgNoVal.length > 0){
            $(".valida-upload-img").css("display","block");
            $(".valida-upload-img span").text("Las siguientes imágenes NO cumplen con dimensiones permitidas(ancho max: "+VisualizadorImg.dimension.w+" px, alto max: "+VisualizadorImg.dimension.h+" px) y fueron eliminadas: "+VisualizadorImg.imgNoVal);
            VisualizadorImg.eliminarImgsNoValidas();
            
        }
     },
    eliminarImgsNoValidas:function(){

        /*$iconDelte = $(this);
         $iconDelte.parent().find("img").attr("src","beneficio/1.jpg");
         $iconDelte.parent().find("span.t-image").text("");
         $iconDelte.parent().find("a.thumbnail").removeClass("load");
         //$iconDelte.hide('slow');
         $iconDelte.remove();*/
       $(".thumbnail.load").each(function(){	
            var nameImg = $(this).parent().find("span.t-image").text();			
            if($.inArray(nameImg,VisualizadorImg.imgNoVal) !== -1){
                $(this).parent().find("img").attr("src",VisualizadorImg.getImgExample());
                $(this).parent().find("span.t-image").text("");
                $(this).parent().find("a.thumbnail").removeClass("load");
                $(this).parent().find(".button-checkbox").css("display","none");
                VisualizadorImg.deleImageFromTypeFile(nameImg);
            }
        //$.inArray("3423454322254.jpg",imgs);
        //imgLoad.push({src:$(this).find("img").attr("src"),name:$(this).parent().find("span.t-image").text()});
       });
       if(VisualizadorImg.imgNoVal!==null && VisualizadorImg.imgNoVal.length > 0){
           VisualizadorImg.reordenarImagen();
       }
       
    },
    deleImageFromTypeFile:function(name){ 
        var fileList = $("#f-adjuntar")[0].files;
        if(fileList!==null && fileList!=='undefined' && fileList.length > 0){
            for(var i = 0; i < fileList.length; i++){
                if(fileList[i].name === name){
                    fileList[i].name = "";
                    fileList[i].size = 0;   
                    break;
                }
            }
        }
    },
    reordenarImagen:function(){
        var imgLoad=[];
        $(".thumbnail.load").each(function(){	
                imgLoad.push({src:$(this).find("img").attr("src"),name:$(this).parent().find("span.t-image").text()});
        });
        $(".thumbnail").each(function(index){
            if(index < imgLoad.length){
                $(this).find("img").attr("src",imgLoad[index].src);
                $(this).parent().find("span.t-image").text(imgLoad[index].name);                
                $(this).parent().find("span.button-checkbox").css("display","block");
                $(this).removeClass("load")
                       .addClass("load");
                       
            }
            else{
                $(this).find("img").attr("src",VisualizadorImg.getImgExample());
                $(this).parent().find("span.t-image").text("");
                $(this).addClass("load")
                       .removeClass("load");
                $(this).parent().find("span.button-checkbox").css("display","none");
            }
        });
        $("ol.carousel-indicators li").removeClass("active");
        $("ol.carousel-indicators li:eq(0)").addClass("active");		
    },
    cleanImgValidas:function(){
       $(".name-img-validas input").remove();  
    },
    addImgValida:function(name){
        var index = $(".name-img-validas input").length;
        $(".name-img-validas").append("<input type='hidden' name='nameImagenesValidas["+index+"]' value ='"+name+"'/>");
    }
    
};
var Beneficio = { 
    onKeyEnterCondicion:function(e){
        if(e.which === 13) {
                Beneficio.agregaCodicion($(this).parent().find("button.add-more"));
                return false;
        }
    },
    onKeyEnterAdicional:function(e){
        if(e.which === 13) {
                Beneficio.agregaProductoAdicional($(this).parent().find("button.add-more"));
                return false;
        }
    },
    init:function(arrayImgs){
        //.- generamos visualizador de iamgenes cargadas        
        this.generarVisualizadorImagenes(arrayImgs);
        VisualizadorImg.init(700,420);
        
    },
    generarItemRow:function(urlImg,nombreImagenPrincipal,includeBtn){
      var item = "";
      if(includeBtn){
          item =    '<div class="col-md-3 content-img-benefio">'+                    
                    '    <span class="button-checkbox sup-izq">'+
                    '        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>'+
                    '        <input type="checkbox" class="hidden">'+
                    '        <input class="nameImg" type="hidden" value="'+nombreImagenPrincipal+'"/>'+
                    '    </span>'+
                    '    <a href="#" class="thumbnail"><img src="'+urlImg+'" alt="Image" style="max-width:100%;"></a>'+
                    '    <span class ="t-image">'+nombreImagenPrincipal+'</span>'+
                    '    <span class="glyphicon glyphicon-remove icon-delete-img" aria-hidden="true"></span>'+
                    '</div>';
      }  
      else{
          item =    '<div class="col-md-3 content-img-benefio">'+
                    '    <span class="button-checkbox sup-izq"/>'+
                    '    <a href="#" class="thumbnail"><img src="'+urlImg+'" alt="Image" style="max-width:100%;"></a>'+
                    '    <span class ="t-image"></span>'+
                    '    <span class="glyphicon glyphicon-remove icon-delete-img" aria-hidden="true"></span>'+
                    '</div>';
      }
        
        return item;
    },
    generarVisualizadorImagenes:function(arrayImagenes){
        var totalPermitidos = $("#totalPermitidos").val();
        var nImages = arrayImagenes.length;
        var indicators = totalPermitidos/4 + (totalPermitidos%4===0?0:1);
        //.- indicadores
        var htmlLiIndicators = "";
        for(var i = 0;i < indicators ;i++){
            htmlLiIndicators+= '<li data-target="#Carousel" data-slide-to="'+i+'" class=""></li>';
        }
        var carouselIndicators = '<ol class="carousel-indicators">'+htmlLiIndicators+'</ol>';
        
        var countFila = 0;
        var htmlTemp = "";
        var htmlFinal = "";
        var  imgExample = $("#rutaImagenExample").val();
        var name = "";
        var urlImagen = "";
        for(var i = 0;i < totalPermitidos;i++)
        {
            
            if(countFila === 4){
                countFila = 0;
                htmlFinal += '<div class="item">'+
                            '    <div class="row">'+
                            ''+htmlTemp+''+
                            '    </div>'+
                            '</div>';
                htmlTemp = "";
            }
            if(i < nImages){
               name = arrayImagenes[i].split("/")[arrayImagenes[i].split("/").length-1]; 
               urlImagen = arrayImagenes[i];
            }
            else{
                name = "example-"+i;
                urlImagen = imgExample;
            }
            htmlTemp+= this.generarItemRow(urlImagen,name,i < nImages);
            countFila++;                            
        }
        htmlFinal += '<div class="item">'+
                            '    <div class="row">'+
                            ''+htmlTemp+''+
                            '    </div>'+
                            '</div>';
                    
        var carouselInner = '<div class="carousel-inner"> '+htmlFinal+'</div>';           
        var prevNext = '<a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>'+
                       '<a data-slide="next" href="#Carousel" class="right carousel-control">›</a>';  
               
        var content = '<div class="row">'+
                      '      <div class="col-md-12">'+
                      '          <div id="Carousel" class="carousel slide"> '+
                      ''+carouselIndicators + carouselInner + prevNext +''+
                      '          </div>'+
                      '      </div>'+
                      '</div>';
               
        $(".content-imagenes-add").html(content);
        $("ol.carousel-indicators li:eq(0)").addClass("active");
        $(".content-imagenes-add .carousel-inner .item:eq(0)").addClass("active");
        
    },
    agregaProductoAdicional:function(btn){			
        var $btnAdd = $(btn);
        var index = $(".adicional-added").length;
        //index = index === 0 || index === 1? 0:index - 1;
        var $inputAdicionalAdd = $btnAdd.parent().parent().find("input");
        var adicional = $inputAdicionalAdd.val();	


         var addAdicional = ' <div class="control-group input-group adicional-added" style="margin-top:10px">'+
                                                '	<input type="text" name="adicionales['+index+']" value = "'+adicional+'" class="form-control" placeholder="Eliminar producto adicional" maxlength="150">'+
                                                '	<div class="input-group-btn"> '+
                                                '	  <button class="btn btn-danger remove" type="button" onclick="Beneficio.eliminarProdAdicional(this)"><i class="glyphicon glyphicon-remove" ></i> Eliminar</button>'+
                                                '	</div>'
                                                ' </div>';
         $(".content-prod-servicio-adicional").append(addAdicional);
         $inputAdicionalAdd.val("");
         Beneficio.refreshListaAdicional();
    },
    eliminarProdAdicional:function(btn){			
        $(btn).parent().parent().remove();
        Beneficio.refreshListaAdicional();
    },
    refreshListaAdicional:function(){
        $(".adicional-added").each(function(index){
            $(this).find("input[type='text']").attr("name","adicionales["+index+"]");
        });
    },
    refreshListaCondiciones:function(){
        $(".condition-added").each(function(index){
            $(this).find("input[type='text']").attr("name","condiciones["+index+"]");
        });
    },
    agregaCodicion:function(btn){
        var $btnAdd = $(btn);
        var index = $(".condition-added").length;
        //index = index === 0 || index === 1? 0:index - 1;
        var $inputCondicionAdd = $btnAdd.parent().parent().find("input");
        var condicion = $inputCondicionAdd.val();	


         var addCondicion = ' <div class="control-group input-group condition-added" style="margin-top:10px">'+
                                                '	<input type="text" name="condiciones['+index+']" value = "'+condicion+'" class="form-control" placeholder="Eliminar condición comercial">'+
                                                '	<div class="input-group-btn"> '+
                                                '	  <button class="btn btn-danger remove" type="button" onclick="Beneficio.eliminarCondicion(this)"><i class="glyphicon glyphicon-remove" ></i> Eliminar</button>'+
                                                '	</div>'
                                                ' </div>';
         $(".content-condicion-comercial").append(addCondicion);
         $inputCondicionAdd.val("");
         
         Beneficio.refreshListaCondiciones();
    },
    eliminarCondicion:function(btn){
        $(btn).parent().parent().remove();
        Beneficio.refreshListaCondiciones();
    },
    onImgGenericSelected:function(e){
        if($(this).hasClass("selected")){
            $(this).removeClass("selected");
        }
        else{
            $(this).addClass("selected");
        }
        
        var n = $(".img-generica.selected").length;
        $("label.count-img-selected").text(n+ " Imágenes seleccionadas.");
    },
    cleanButton:function(){
	
        $(".button-checkbox").each(function(){
            var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

            $button.find('.state-icon')
                    .removeClass()
                    .addClass('state-icon ' + settings['off'].icon);
            $button
                    .removeClass('btn-primary active')
                    .addClass('btn-default');
            $checkbox.prop('checked', false);

        });
    },
    onChangePrincipal:function(btn){
        this.cleanButton();
        //var isChecked = $(btn).parent().find("input[type='checkbox']").is(':checked');
        var $button = $(btn),
                $checkbox = $button.parent().find("input[type='checkbox']"),
                color = $button.data('color'),
                settings = {
                    on: {
                        icon: 'glyphicon glyphicon-check'
                    },
                    off: {
                        icon: 'glyphicon glyphicon-unchecked'
                    }
                };

        $checkbox.prop('checked', !$checkbox.is(':checked'));
        var isChecked = $checkbox.is(':checked');
        $button.data('state', (isChecked) ? "on" : "off");
        $button.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$button.data('state')].icon);

        if (isChecked) {
            $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
        } else {
            $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
        }
    },
    cleanSeleccionPrincipal:function(){
         $(".button-checkbox").each(function () {
            var $widget = $(this),
                    $button = $widget.find('button'),
                    $checkbox = $widget.find('input:checkbox'),
                    settings = {
                        on: {
                            icon: 'glyphicon glyphicon-check'
                        },
                        off: {
                            icon: 'glyphicon glyphicon-unchecked'
                        }
                    };

            $button.find('.state-icon')
                    .removeClass()
                    .addClass('state-icon ' + settings['off'].icon);
            $button
                    .removeClass('btn-primary active')
                    .addClass('btn-default');
            $checkbox.prop('checked', false);
        });
},
    onSeleccionImagenPrivadas:function(){
        VisualizadorImg.imgNoVal = [];
        VisualizadorImg.cleanImgValidas();       
        var haSeleccionado=false;
        var fileList = this.files;
        if(fileList!==null && fileList!=='undefined' && fileList.length > 0){
            Beneficio.cleanThumbnail();
            var anyWindow = window.URL || window.webkitURL;
            for(var i = 0; i < fileList.length; i++){
                haSeleccionado = true;
              //get a blob to play with
              var objectUrl = anyWindow.createObjectURL(fileList[i]);
              $(".thumbnail:eq("+i+") img").attr("src", objectUrl );
              $(".thumbnail:eq("+i+")").parent().find("span.button-checkbox").css("display","block");
              $(".thumbnail:eq("+i+")").parent().find("span.button-checkbox").html(Beneficio.getHtmlBtnPrincipal(fileList[i].name));
              $(".thumbnail:eq("+i+")").addClass("load");
              $(".thumbnail:eq("+i+")").parent().find("span.t-image").text(fileList[i].name);
              //$('.preview-area').append('<img src="' + objectUrl + '" />');
              // get rid of the blob
              window.URL.revokeObjectURL(fileList[i]);
              VisualizadorImg.validaDimensionImg(fileList[i],fileList.length);
            }
        }
        else{
            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Ud no ha seleccionado ninguna imágen, se conservan las anteriores", titulo: "Imágenes"});
        }
        if(haSeleccionado){
            Beneficio.setTipoCarga(1);
        }
        
},
    getHtmlBtnPrincipal:function(nombreImagenPrincipal){

        return   '        <button type="button" class="btn btn-default" data-color="primary" onclick="Beneficio.onChangePrincipal(this);"><i class="state-icon glyphicon glyphicon-unchecked"></i>Pricipal</button>'+
                 '        <input type="checkbox" class="hidden">'+
                 '        <input class="nameImg" type="hidden" value="'+nombreImagenPrincipal+'"/>';
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
                        $(".content-body-generico").html('');
                        var countFila = 0;
                        var htmlTemp = "";
                        var htmlFinal = "";
                        for(var i = 0;i < array.length;i++)
                        {
                            if(countFila === 4){
                                countFila = 0;
                                htmlFinal += '<div class="row">'+htmlTemp+'</div>';
                                htmlTemp = "";
                            }                           
                            htmlTemp+=  '<div class="col-xs-6 col-md-3">'+
                                        '    <a  class="thumbnail">'+
                                        '        <img src ="'+array[i]+'" class ="img-generica" style="cursor:pointer;"/>'+
                                        '    </a>'+
                                        '</div>';
                            countFila++;                            
                        }
                        htmlFinal += '<div class="row">'+htmlTemp+'</div>';
                        $(".content-body-generico").html(htmlFinal);
                        $(".content-body-generico").append('<div class="form-group">'+
                                                            '    <label class ="count-img-selected">0 Imagenes seleccionadas</label>'+
                                                            '</div>');
                        
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
          

    },
    cleanThumbnail:function(){       
       $(".carousel-inner .thumbnail img").attr("src",$("#rutaImagenExample").val());
       $(".content-img-benefio span.button-checkbox").html('');
    },
    setTipoCarga:function(tipoCarga){
        $("#tipoCargaImagen").val(tipoCarga);
    },
    onCargaSeleccionImagenesGenerica:function(){
        //limpiamos a imagenes ejemplos
      VisualizadorImg.cleanImgValidas();
      
      var haSeleccionado=false;
      //tipo carga imagen, 1: Privada,2:Generica
      var nImg=$(".carousel-inner .thumbnail img").length;
      var nSelected =$(".img-generica.selected").length;
      var name = "";
      if(nSelected>0){
        this.cleanThumbnail();
        $(".img-generica.selected").each(function(index){
            haSeleccionado = true;
            if(index < nImg){
                var src = $(this).attr("src");
                name = src.split("/")[src.split("/").length-1];
                $(".carousel-inner .thumbnail img:eq("+index+")").attr("src",src);
                $(".thumbnail:eq("+index+")").removeClass("load")
                                             .addClass("load");
                $(".carousel-inner .thumbnail:eq("+index+")").parent().find("span.button-checkbox").css("display","block");
                $(".carousel-inner .thumbnail:eq("+index+")").parent().find("span.button-checkbox").html(Beneficio.getHtmlBtnPrincipal(name));
                $(".carousel-inner .thumbnail:eq("+index+")").parent().find("span.t-image").text(name);
                VisualizadorImg.addImgValida(src);
            }
        });
      }
      else{
          ModalBennder.mostrar({tipo: "advertencia", mensaje: "Ud no ha seleccionado ninguna imágen, se conservan las anteriores", titulo: "Imágenes"});
      }
      if(haSeleccionado){
          this.setTipoCarga(2);
      }
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
        
        //.- sucursales seleccionadas
        var inputSucursales ="";
        $(".content-sucursales input.i-sucursales").remove();
        $(".content-sucursales input[type='checkbox']:checked").each(function(index){
            var v = $(this).val();
            inputSucursales+="<input class = 'i-sucursales' name='sucursalesSelected["+index+"]' type='hidden' value='"+v+"'/>";
        });
        $(".content-sucursales").append(inputSucursales);
        //.- iamgene selecccionada
        var imgP = $(".button-checkbox button.active").parent().find("input.nameImg").val();
        $("#nameImagePrincipal").val(imgP);
        $("#id-tipo-beneficio").val($("#li-tipo-promo li.active input.tb").val());
        
        
        
        
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
        
    /*var fd = new FormData();
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
        mimeType:"text/html; charset=ISO-8859-1",
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
            window.location.href = "../home.html";
        }
    });*/
        
        
        $("#form-beneficio").submit();
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
    onChangeRegion:function(){        
        var idRegion = $("#select-region").val();
        if(idRegion!=='-1'){
            $.ajax({
                url: context+'/beneficio/getComunaByIdReg.html',
                type: 'GET',
                dataType: 'JSON',
                data: {idRegion:idRegion},
                success: function (array) {
                    if(array !==undefined && array !== null){
                        $("#select-comuna option").remove();
                        $("#select-comuna").append("<option value ='-1'>--Seleccione Comuna--</option>");
                        for(var i= 0;i < array.length;i++){
                           var c = array[i];
                           $("#select-comuna").append("<option value ='"+c.idComuna+"'>"+c.nombre+"</option>");
                        } 
                    }
                },
                error: function (x, y, z) {
                    ModalBennder.mostrar({tipo: "error", mensaje: "Error al cargar comunas", titulo: "Comuna Sucursal"});
                }
            }); 
        }
        else{
            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Favor seleccionar región.", titulo: "Región Sucursal"});
        }
    },
    onChangeComuna:function(){        
        var idComuna = $("#select-comuna").val();
        if(idComuna!=='-1'){
            $.ajax({
                url: context+'/beneficio/getSucursalByIdComuna.html',
                type: 'GET',
                dataType: 'JSON',
                data: {idComuna:idComuna},
                success: function (array) {
                    $(".content-sucursales").html('');
                    var htmlSucursal = "";
                    if(array !==undefined && array !== null){
                        for(var i= 0;i < array.length;i++){
                            var sp = array[i];
                            htmlSucursal =  '<div class="form-check form-check-inline">'+
                                                ' <label class="form-check-label">'+
                                                '   <input class="form-check-input" type="checkbox" id="suc-'+i+'" value="'+sp.idSucursal+'" > '+sp.nombreSucursal+' '+                                    
                                                '  </label>'
                                                '</div>';
                            $(".content-sucursales").append(htmlSucursal);
                        } 
                    }
                },
                error: function (x, y, z) {
                    ModalBennder.mostrar({tipo: "error", mensaje: "Error al cargar sucursales", titulo: "Sucursal"});
                }
            }); 
        }
        else{
            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Favor seleccionar comuna.", titulo: "Sucursal"});
        }
    },
    onChangeCategoria:function(){        
        var idCat = $("#select-categorias").val();
        if(idCat!=='-1'){
            ModalLoading.mostrar();
            $.ajax({
                url: context+'/beneficio/getSubCatById.html',
                type: 'GET',
                dataType: 'JSON',
                data: {idCat:idCat},
                success: function (array) {
                    if(array !==undefined && array !== null){
                        $("#select-sub-categorias option").remove();
                        //$("#select-sub-categorias").append("<option value ='-1'>--Seleccione Sub Categoria--</option>");
                        var htmlOption = "<option value ='-1'>--Seleccione Sub Categoria--</option>";
                        for(var i= 0;i < array.length;i++){
                           var c = array[i];
                           htmlOption+="<option value ='"+c.idCategoria+"'>"+c.nombre+"</option>";
                           //$("#select-sub-categorias").append("<option value ='"+c.idCategoria+"'>"+c.nombre+"</option>");
                        } 
                        $("#select-sub-categorias").html(htmlOption);
                    }
                    ModalLoading.cerrar();
                },
                error: function (x, y, z) {
                    ModalLoading.cerrar();
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



