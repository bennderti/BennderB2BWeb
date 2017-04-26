jQuery(document).on('ready', function() {
        $('#myModal').modal({
		  backdrop: 'static',
		  keyboard: false,
		  show:false
        }); 
	/*		
        $('#myModal').on('shown.bs.modal', function () {
                  console.log("shown.bs.modal!!!");
        });*/
});
//.- Logica de mostrar modal genérico

// Modal Bennder		
var ModalBennder  = {
    limpiarEstilo:function(){
      $(".modal-bennder .modal-header").removeClass("error informativo advertencia");
    },
    TIPO:{
        INFORMATIVO:"informativo",
        ADVERTENCIA:"advertencia",
        ERROR:"error"        
    },
    eventoAceptar:function(f){
        $(".modal-bennder button.btn-aceptar-bennder").off("click");
        $(".modal-bennder button.btn-aceptar-bennder").on("click",function(){
            f();
            return false;
        });
    },
    eventoCancelar:function(f){
        $(".modal-bennder button.btn-cancelar-bennder").off("click");
        $(".modal-bennder button.btn-cancelar-bennder").on("click",function(){
            f();
            return false;
        });
    },
    agregarTipo:function(tipo){
        this.limpiarEstilo();
        if(tipo === this.TIPO.INFORMATIVO || tipo === this.TIPO.ADVERTENCIA || tipo === this.TIPO.ERROR ){
            $(".modal-bennder .modal-header").addClass(tipo);
        }
    },
    mostrar:function(opt){
       //.- objeto
       //{titulo:"",mensaje:"",tipo:"",eventoAceptar:function(){},eventoCancelar:function(){}};
       $("div.modal-bennder .modal-content .modal-title").html(opt.titulo);
       $("div.modal-bennder .modal-content .modal-text").html(opt.mensaje);
       if(opt.tipo !== undefined){
          this.agregarTipo(opt.tipo);
       }
       if(opt.eventoAceptar !== undefined){
          this.eventoAceptar(opt.eventoAceptar);
       }
       if(opt.eventoCancelar !== undefined){
          this.eventoCancelar(opt.eventoCancelar);
       }
	   /*$('#myModal').off('hide.bs.modal');
	   $('#myModal').on('hide.bs.modal', function (e) {
					//var button = e.relatedTarget;
                        //console.log("shown.bs.modal!!!");
             });*/
       $('#myModal').modal('show');
    },
    close:function(){
        $('#myModal').modal('hide');
        this.limpiarEstilo();
    }
};