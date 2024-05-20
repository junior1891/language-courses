({
	helperMethod : function(component, event, helper) {
		console.log('CLASE LIGHTNING BUTTON');
        var mensj=component.find("Valor").get('v.value');
        var actionSF=component.get("c.getAction");
        actionSF.setParams({"mensaje": mensj});
        
         actionSF.setCallback(this,function(response){
		var stats=response.getState();
             console.log("response"+stats);
	});
        $A.enqueueAction(actionSF);
    }
})