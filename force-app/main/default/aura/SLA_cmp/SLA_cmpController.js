({
	init : function(component, event, helper) {
		/*alert('HOLA MUNDO');*/
        var columns =[
            {label: 'Tipo', fieldName:'Tipo__c', type:'text'},
            {label: 'Origen', fieldName: 'Origen__c',type:'text'},
            {label:'Dias',fieldName:'Dias__c',type:'number'}
        ];
        component.set('v.columns',columns);
        helper.getData(component);
	}
})