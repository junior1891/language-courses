({
	handleClick : function(component, event, helper) {
		console.log('CLASE CONTROLLER');
        console.log('valor capturado: '+component.find('Valor').get('v.value'));
        helper.helperMethod(component, event, helper);
    }
})