jQuery(document).on('ready', function () {
    $("#valida-proveedor").click(function (e) {
        ProveedorBennder.guardarProveedor();
        return false;
    });
    //aceptando numericos

    //.- restricciones caractéres
    $("#nombre-proveedor").alphanumeric({allow: ".-_"});
    $("#rut-proveedor").numeric();

    //.- enter 
    $("#nombre-proveedor,#rut-proveedor").keyup(function (e) {
        if (e.keyCode === 13) {
            ProveedorBennder.guardarProveedor();
        }
    });

});

var ProveedorBennder = {  
    validacion:function(){
        if($.trim($("#nombre-proveedor").val()) === ""){
            return {mensaje:"Favor completar nombre de proveedor",isValid : false};
        }
        if($.trim($("#rut-proveedor").val()) === "-1"){
            return {mensaje:"Favor completar rut de proveedor",isValid : false};
        }
        return {mensaje:"OK",isValid : true};
    },
    guardarProveedor:function(){
        var val = this.validacion();
        if(!val.isValid){
            ModalBennder.mostrar({tipo: "advertencia", mensaje: val.mensaje, titulo: "Validación Proveedor"});
            return false;
        }
        
        if($("#select-beneficio").val() === "-1"){
           ModalBennder.mostrar({tipo: "error", mensaje: "Favor seleccionar beneficio", titulo: "Validación Proveedor"});
       }
       else{
           //ModalLoading.mostrar();
           //$("#form-proveedor").submit();
           ModalLoading.mostrar();
            $("#submmit-proveedor").click();
//            $.ajax({
//                url: context+'/guardaInformacionGeneralProveedor.html',
//                type: 'POST',
//                dataType: 'JSON',
//                data: $("#form-proveedor").serialize(),
//                success: function (data) {
//                    if (data.validacion.codigo === '0') {
//                        window.location.href = data.goToUrl;
//                    } else {
//                        ModalBennder.mostrar({tipo: "advertencia", mensaje: data.validacion.mensaje, titulo: "Proveedor"});
//                    }
//                    ModalLoading.cerrar();
//                },
//                error: function (x, y, z) {
//                    ModalLoading.cerrar();
//                    ModalBennder.mostrar({tipo: "error", mensaje: "Problemas al guardar datos proveedor", titulo: "Proveedor"});
//                }
//            });
       }
    },
    onChangeProveedor:function(){        
        var id = $("#lista-proveedor").val();
        if(id !== null && id !== "-1"){
            window.location.href = context+"/proveedor/informacionGeneral.html?id="+id;
        }
        else{
            ModalBennder.mostrar({tipo: "advertencia", mensaje: "Favor seleccionar proveedor", titulo: "Proveedor"});            
        }
    }
};



