({
	doconsultarProductos : function(component, event, helper) {
		var action=component.get("c.getExpiredProducts");
        var recordId = component.get("v.recordId");
        
        action.setParams({
            expprdId:recordId
        });
        
        action.setCallback(this, function(response){
           var state=response.getState();
 
            component.set("v.infoExpPrd",response.getReturnValue());
            console.log('Productos Vencidos' + component.get("v.infoExpPrd.BP_UpdateExpiredProducts__c"));
        	console.log('e: '+state);
        });
    $A.enqueueAction(action);
},
    doInitHelper:function(component, event,helper){
        var action=component.get("c.getExpiredProducts");
        var recordId=component.get("v.recordId");
        console.log('ID: '+ recordId);
        console.log('Productos Vencidos: '+component.get("v.infoExpPrd.BP_UpdateExpiredProducts__c"));
        
        action.setParams({
            expprdId:recordId
        });
        
        action.setCallback(this,function(response){
            var state=response.getState();
            console.log('ESTADO: '+state);
            console.log('PRODUCTOS VENCIDOS: '+component.get("v.infoExpPrd.BP_UpdateExpiredProducts__c"));

        if(state==="SUCCESS"){
            
            component.set("v.infoExpPrd",response.getReturnValue());
            console.log('Productos Vencidos: '+component.get("v.infoExpPrd.BP_UpdateExpiredProducts__c"));
            
            if(component.get("v.infoExpPrd.CustomerID__c")=='200'){
                component.set("v.infoExpPrd",response.getReturnValue());
                console.log('Productos Vencidos: '+component.get("v.infoExpPrd.BP_UpdateExpiredProducts__c"));
                var toastEvent=$A.get("e.force:showToast");
                toastEvent.setParams({
                    title:'Exito!!',
                    message:'Productos Vencidos consultado con éxito',
                    type:'success'
                });
                toastEvent.fire();
                $A.get('e.force:refreshView').fire();
            }
            else{
                var toastEvent=$A.get("e.force:showToast");
                toastEvent.setParams({
                    title:'Error!!',
                    message:'Error en la consulta',
                    type:'error'
                });
                toastEvent.fire();
                $A.get('e.force:refreshView').fire();
            }
        }else{
                this.showToast(component,"Aviso","Error en la consulta","ERROR");
            }
        });
        $A.enqueueAction(action);
    },
    showToast:function(component,title,message,typ){
        component.find("notificationsLib").showToast({
            "title": title,
            "message": message,
            "key": 'info_alt',
            "type":typ
        });
    },
    startProcessing:function(c){
        c.set('v.isProcessing',true);
    },
    stopProcessing: function(c){
        c.set('v.isProcessing',false);
    }
})