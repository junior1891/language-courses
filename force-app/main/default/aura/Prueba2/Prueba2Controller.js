({
	inicializarprueba2 : function(component, event, helper) {

    component.set('v.columnas',[
    {label: 'Opportunity name', fieldName: 'Id', type: 'text'},
    {label: 'Account name', fieldName: 'Name', type: 'text'},
    {label: 'Close Date', fieldName: 'CloseDate', type: 'date'},
    ]);
    var prueba2= component.get('c.devolver');
        prueba2.setParams({
        opp:component.get('v.recordId')
        });
        prueba2.setCallback(this, function(respuesta){
        //alert(respuesta);
        component.set('v.data',respuesta.getReturnValue());
        });
        $A.enqueueAction(prueba2);
}
        
})