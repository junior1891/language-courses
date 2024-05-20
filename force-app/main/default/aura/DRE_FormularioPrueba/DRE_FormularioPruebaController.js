({
	handleLoad : function(component, event, helper) {
		alert('handleLoad');
	},
    handleSubmit : function(component, event, helper) {
		alert('handleSubmit');
	},
 handleSuccess : function(component, event, helper) {
     var elemento=component.find('bttn'); //obtener el elemento botón que tiene el aura:id bttn
     elemento.set('v.variant','success');//cambiar el variant del botón por el elemento que obtuvimso en el find
     component.set('v.nombre','Guardado...');//cambiar el label del botón por medio de la variable
     },
    click : function (component, event, helper){
        alert(component.find('stage').get('v.value'));
    }
})